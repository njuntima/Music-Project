from flask import Flask, render_template, url_for, redirect, request, flash, session
import mysql.connector
from mysql.connector import Error
from werkzeug.security import generate_password_hash, check_password_hash

app = Flask(__name__, template_folder='assets/templates', static_folder='assets/static')
app.secret_key = 'unhackablekey123'

def get_db_connection():
    try:
        connection =  mysql.connector.connect(
            host="localhost",
            user="root",
            #password="root",
            database="CS4604_Crappy_Spotify_Clone", 
            ssl_disabled=True 
        )
        if connection.is_connected():
            return connection
    except Error as e:
        print(f"Error: {e}")
        return None
    
@app.route('/')
def db():
    try:
        connection = get_db_connection()

        return render_template('index.html', dbstatus="DB Connected")

    except Exception as e:

        return render_template('index.html', dbstatus="DB Connection Failed")

@app.route('/home')
def home():
    if 'username' not in session:
        return redirect(url_for('db'))
    return render_template('home.html', name=session.get('username'))
  
@app.route('/form_login',methods=["POST","GET"])
def login():
    username = request.form['Username']
    password = request.form['Password']

    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)

    query = "SELECT * FROM USER WHERE user_name = %s"
    cursor.execute(query, (username,))
    user = cursor.fetchone()

    if user is None:
    
        return render_template('index.html',info = 'ERROR: User not found') 

    if check_password_hash(user['password_hash'], password):
        session['username'] = username 
        return redirect(url_for('home', name=username))
    else:
        return render_template('index.html',info = 'ERROR: Wrong password')
    
@app.route('/form_register', methods=["GET", "POST"])
def register():
    if request.method == "POST":
        username = request.form['Username']
        password = request.form['Password']

        connection = get_db_connection()
        cursor = connection.cursor(dictionary=True)

        cursor.execute("SELECT * FROM USER WHERE user_name = %s", (username,))
        existing_user = cursor.fetchone()

        if existing_user:
            
            return render_template('index.html',info = 'ERROR: User already exists')


        password = generate_password_hash(password)
        cursor.execute("INSERT INTO USER (user_name, password_hash) VALUES (%s, %s)", (username, password))
        connection.commit()
        
        
        return redirect(url_for('home', name=username))



    return redirect(url_for('db'))

@app.route('/form_change_password', methods=["POST"])
def change_password():
    # 1) Ensure user is logged in
    if 'username' not in session:
        return redirect(url_for('db'))

    username = session['username']
    curr_password    = request.form['curr_password']
    new_password     = request.form['new_password']
    confirm_password = request.form['confirm_password']

    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)
    cursor.execute( "SELECT password_hash FROM USER WHERE user_name = %s",(username,))
    user = cursor.fetchone()

    if user is None or not check_password_hash(user['password_hash'], curr_password):
        cursor.close()
        connection.close()
        return render_template("home.html",name=username,dbstatus="Connected",info="ERROR: Incorrect current password")


    if new_password != confirm_password:
        cursor.close()
        connection.close()
        return render_template("home.html",name=username, dbstatus="Connected", info="ERROR: New passwords do not match")

  
    new_hash = generate_password_hash(new_password)
    cursor.execute("UPDATE USER SET password_hash = %s WHERE user_name = %s", (new_hash, username))
    connection.commit()
    cursor.close()
    connection.close()

    return render_template("home.html",name=username, dbstatus="Connected",info="Password updated successfully")



    
@app.route('/logout', methods=['POST'])
def logout():
    session.pop('username', None)  
    return redirect(url_for('db')) 
    
    
@app.route('/about')
def about():
    return render_template('about.html')


@app.route('/insert_artist', methods=["POST"])
def insert_artist():
    if 'username' not in session:
        return redirect(url_for('db'))

    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    a_name = request.form['artist_name']
    cursor.execute("INSERT INTO ARTIST (a_name) VALUES (%s)", (a_name,))
    conn.commit()
    cursor.execute("UPDATE USER SET artist = %s WHERE user_name = %s", (a_name, session['username']))
    conn.commit()
    cursor.close()
    return redirect(url_for('db'))

@app.route("/create_playlist", methods=["POST"])
def create_playlist():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    playlist_name = request.form['p_name']
    cursor.execute("INSERT INTO PLAYLIST (p_name) VALUES (%s)", (playlist_name,))
    conn.commit()
    cursor.close()
    flash("Playlist created successfully!")
    print("Done!")
    return redirect(url_for('home'))


@app.route('/add_song_to_playlist', methods=['POST'])
def add_song_to_playlist():
    playlist_name = request.form['p_name']  # Playlist name from the form
    song_name = request.form['name']  # Song name from the form

    conn = get_db_connection()
    cursor = conn.cursor()

    try:
        # Retrieve playlist_id based on playlist_name
        cursor.execute('SELECT p_id FROM playlist WHERE p_name = %s', (playlist_name,))
        playlist_result = cursor.fetchone()
        if not playlist_result:
            flash(f'Playlist with name "{playlist_name}" not found.', 'error')
            return redirect(url_for('index'))

        playlist_id = playlist_result['p_id']

        # Retrieve song_id based on song_name
        cursor.execute('SELECT song_id FROM songs WHERE song_name = %s', (song_name,))
        song_result = cursor.fetchone()
        if not song_result:
            flash(f'Song with name "{song_name}" not found.', 'error')
            return redirect(url_for('index'))

        song_id = song_result['song_id']

        # Insert into the composed_of join table
        cursor.execute(
            'INSERT INTO composed_of (p_id, song_id) VALUES (%s, %s)',
            (playlist_id, song_id)
        )
        conn.commit()
        flash('Song added to playlist successfully!', 'success')

    except Exception as e:
        conn.rollback()
        flash(f'Error adding song to playlist: {e}', 'error')
    
    finally:
        conn.close()

    return redirect(url_for('view'))

@app.route('/remove_song_from_playlist', methods=['POST'])
def remove_song_from_playlist():
    playlist_name = request.form['p_name']  # Playlist name from the form
    song_name = request.form['name']  # Song name from the form

    conn = get_db_connection()
    cursor = conn.cursor()

    try:
        # Retrieve playlist_id based on playlist_name
        cursor.execute('SELECT p_id FROM playlist WHERE p_name = %s', (playlist_name,))
        playlist_result = cursor.fetchone()
        if not playlist_result:
            flash(f'Playlist with name "{playlist_name}" not found.', 'error')
            return redirect(url_for('index'))

        playlist_id = playlist_result['p_id']

        # Retrieve song_id based on song_name
        cursor.execute('SELECT song_id FROM song WHERE song_name = %s', (song_name,))
        song_result = cursor.fetchone()
        if not song_result:
            flash(f'Song with name "{song_name}" not found.', 'error')
            return redirect(url_for('index'))

        song_id = song_result['song_id']

        # Delete from the composed_of join table
        cursor.execute(
            'DELETE FROM composed_of WHERE p_id = %s AND song_id = %s',
            (playlist_id, song_id)
        )
        conn.commit()
        flash('Song removed from playlist successfully!', 'success')

    except Exception as e:
        conn.rollback()
        flash(f'Error removing song from playlist: {e}', 'error')

    finally:
        conn.close()

    return redirect(url_for('view'))



@app.route('/insert_song', methods=["POST"])
def insert_song():
    print("insert song endpoint")
    #song_id = request.form['song_id']
    name = request.form['name']
    #num_streams = request.form['num_streams']
    year = request.form['year']

    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute(
        "INSERT INTO song (name, year) VALUES (%s, %s)",
        (name, year)
    )
    conn.commit()
    cursor.close()
    return redirect(url_for('artist_dashboard'))

@app.route('/insert_album', methods=["POST"])
def insert_album():
    print("insert album endpoint")
    #al_id = request.form['al_id']
    al_title = request.form['al_title']
    year = request.form['year']
    artist = request.form['artist']

    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute(
        "INSERT INTO album (al_title, year, artist) VALUES (%s, %s, %s)",
        (al_title, year, artist)
    )
    conn.commit()
    cursor.close()
    return redirect(url_for('artist_dashboard'))

@app.route('/delete_artist', methods=["DELETE"])
def delete_artist(artist_id):
    print("delete artist endpoint")
    cursor = mysql.connection.cursor()
    cursor.execute("DELETE FROM artists WHERE artist_id = %s", (artist_id,))
    mysql.connection.commit()
    cursor.close()
    return redirect(url_for('db')) 

@app.route('/delete_song', methods=["POST"])
def delete_song():
    print('delete song endpoint')
    songName = request.form['name']
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM song WHERE name = %s", (songName,))
    conn.commit()
    cursor.close()
    return redirect(url_for('Artist'))

@app.route('/delete_album', methods=["DELETE"])
def delete_album(album_id):
    print("delete album endpoint")
    cursor = mysql.connection.cursor()
    cursor.execute("DELETE FROM albums WHERE album_id = %s", (album_id,))
    mysql.connection.commit()
    cursor.close()

@app.route('/view')
def view():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Top100Songs")
    topsongs = cursor.fetchall()
    cursor.execute("SELECT * FROM Top100Artists")
    topartists = cursor.fetchall()
    cursor.close()
    conn.close()
    print(topsongs)
    print(topartists)

    return render_template(
        'view.html',
        dbstatus="Connected",
        topsongs=topsongs,
        topartists=topartists
    )

@app.route('/account')
def account():
    if 'username' not in session:
        return redirect(url_for('db'))

    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT artist, admin FROM USER WHERE user_name = %s", ((session['username']),))
    role = cursor.fetchone()

    print(role)

    return render_template('account.html', content=session['username'], role=role)

@app.route('/artist-dashboard')
def artist_dashboard():
    if 'username' not in session:
        return redirect(url_for('db'))

    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT artist FROM USER WHERE user_name = %s", ((session['username']),))
    artist = cursor.fetchall()

    return render_template('artist.html', artist=artist)

if __name__ == '__main__':
    app.run(debug=True)
