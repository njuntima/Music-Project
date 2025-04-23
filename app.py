from flask import Flask, render_template, url_for, redirect, request,flash,session
import mysql.connector
from mysql.connector import Error

app = Flask(__name__, template_folder='assets/templates', static_folder='assets/static')
app.secret_key = 'unhackablekey123'


@app.route('/')
def db():
    try:
        connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="root",
            database="CS4604_Crappy_Spotify_Clone"
        )

        return render_template('index.html', dbstatus="DB Connected")

    except Exception as e:

        return render_template('index.html', dbstatus="DB Connection Failed")

@app.route('/home')
def home():
    name = request.args.get('name') 
    return render_template('home.html', name=name)
  
@app.route('/form_login',methods=["POST","GET"])
def login():
    username = request.form['Username']
    password = request.form['Password']

    connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="root",
        database="CS4604_Crappy_Spotify_Clone"
    )
    cursor = connection.cursor(dictionary=True)

    query = "SELECT * FROM user WHERE user_name = %s"
    cursor.execute(query, (username,))
    user = cursor.fetchone()

    if user is None:
    
        return render_template('index.html',info = 'ERROR: User not found') 

    if user['password_hash'] == password:
        session['username'] = username 
        return redirect(url_for('home', name=username))
    else:
       
        return render_template('index.html',info = 'ERROR: Wrong password')
    
    
    
@app.route('/form_register', methods=["GET", "POST"])
def register():
    if request.method == "POST":
        username = request.form['Username']
        password = request.form['Password']

        connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="root",
            database="CS4604_Crappy_Spotify_Clone"
        )
        cursor = connection.cursor(dictionary=True)

        cursor.execute("SELECT * FROM user WHERE user_name = %s", (username,))
        existing_user = cursor.fetchone()

        if existing_user:
            
            return render_template('index.html',info = 'ERROR: User already exists')

        cursor.execute("INSERT INTO user (user_name, password_hash) VALUES (%s, %s)", (username, password))
        connection.commit()
        
        
        return redirect(url_for('home', name=username))



    return redirect(url_for('db'))

@app.route('/form_change_password', methods=["POST"])
def change_password():
    if 'username' not in session:
        return redirect(url_for('login'))

    username = session['username']
    curr_password = request.form['curr_password']
    new_password = request.form['new_password']
    confirm_password = request.form['confirm_password']

    if new_password != confirm_password:
        return render_template("home.html", name=username, dbstatus="Connected", info="ERROR: New passwords do not match")

    connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="root",
        database="CS4604_Crappy_Spotify_Clone"
    )
    cursor = connection.cursor(dictionary=True)

    # get current password
    cursor.execute("SELECT password_hash FROM user WHERE user_name = %s", (username,))
    user = cursor.fetchone()

    if user is None or user['password_hash'] != curr_password:
        return render_template("home.html", name=username, dbstatus="Connected", info="ERROR: Incorrect current password")

    # update password
    cursor.execute("UPDATE user SET password_hash = %s WHERE user_name = %s", (new_password, username))
    connection.commit()
    cursor.close()
    connection.close()

    return render_template("home.html", name=username, dbstatus="Connected", info="Password updated successfully")



    
@app.route('/logout', methods=['POST'])
def logout():
    session.pop('username', None)  
    return redirect(url_for('db')) 
    
    
@app.route('/about')
def about():
    return render_template('about.html')


@app.route('/insert_artist', methods=["POST"])
def insert_artist():
    print("insert artist endpoint")
    a_name = request.form['a_name']  # should be request, not requests
    cursor = mysql.connection.cursor()
    cursor.execute("INSERT INTO artists (a_name) VALUES (%s)", (a_name,))
    mysql.connection.commit()
    cursor.close()
    return redirect(url_for('db'))



@app.route('/insert_song', methods=["POST"])
def insert_song():
    print("insert song endpoint")
    song_id = request.form['song_id']
    name = request.form['name']
    num_streams = request.form['num_streams']
    year = request.form['year']

    cursor = mysql.connection.cursor()
    cursor.execute(
        "INSERT INTO songs (song_id, name, num_streams, year) VALUES (%s, %s, %s, %s)",
        (song_id, name, num_streams, year)
    )
    mysql.connection.commit()
    cursor.close()
    return redirect(url_for('db'))

@app.route('/insert_album', methods=["POST"])
def insert_album():
    print("insert album endpoint")
    al_id = request.form['al_id']
    al_title = request.form['al_title']
    year = request.form['year']
    artist = request.form['artist']

    cursor = mysql.connection.cursor()
    cursor.execute(
        "INSERT INTO albums (al_id, al_title, year, artist) VALUES (%s, %s, %s, %s)",
        (al_id, al_title, year, artist)
    )
    mysql.connection.commit()
    cursor.close()
    return redirect(url_for('db'))

@app.route('/delete_artist', methods=["DELETE"])
def delete_artist(artist_id):
    print("delete artist endpoint")
    cursor = mysql.connection.cursor()
    cursor.execute("DELETE FROM artists WHERE artist_id = %s", (artist_id,))
    mysql.connection.commit()
    cursor.close()
    return redirect(url_for('db')) 

@app.route('/delete_song', methods=["DELETE"])
def delete_song(song_id):
    print('delete song endpoint')
    cursor = mysql.connection.cursor()
    cursor.execute("DELETE FROM songs WHERE song_id = %s", (song_id,))
    mysql.connection.commit()
    cursor.close()

@app.route('/delete_album', methods=["DELETE"])
def delete_album(album_id):
    print("delete album endpoint")
    cursor = mysql.connection.cursor()
    cursor.execute("DELETE FROM albums WHERE album_id = %s", (album_id,))
    mysql.connection.commit()
    cursor.close()

if __name__ == '__main__':
    app.run(debug=True)
