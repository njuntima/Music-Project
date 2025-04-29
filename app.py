from flask import Flask, render_template, url_for, redirect, request, flash, session
import mysql.connector
from mysql.connector import Error
from werkzeug.security import generate_password_hash, check_password_hash
from chartkick.flask import chartkick_blueprint, LineChart

app = Flask(__name__, template_folder='assets/templates', static_folder='assets/static')
app.secret_key = 'unhackablekey123'
app.register_blueprint(chartkick_blueprint)


def get_db_connection():
    try:
        connection =  mysql.connector.connect(
            host="localhost",
            user="root",
            password="root",
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

        if user.get('admin'):
            session['role'] = 'admin'
        elif user.get('artist'):
            session['role'] = 'artist'
        else:
            session['role'] = 'user'

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
    session.pop('role', None)  
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

    cursor.execute("SELECT artist from USER WHERE user_name = %s", (session['username'],))
    user_artist = cursor.fetchone()

    if user_artist['artist'] != None:
        flash('Artist for this user already exists. Each user may only have one artist account per user account.')
        return redirect(url_for('artist_dashboard'))

    cursor.execute("SELECT * from ARTIST WHERE a_name = %s", (a_name,))
    artist = cursor.fetchone()
    print(artist)
    if artist:
        flash('Artist with this name already exists. Please try a different name.')
        return redirect(url_for('artist_dashboard'))

    cursor.execute("INSERT INTO ARTIST (a_name) VALUES (%s)", (a_name,))
    conn.commit()
    cursor.execute("UPDATE USER SET artist = %s WHERE user_name = %s", (a_name, session['username']))
    conn.commit()
    cursor.close()
    return redirect(url_for('artist_dashboard'))

@app.route("/create_playlist", methods=["POST"])
def create_playlist():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    playlist_name = request.form['p_name']
    creator = session['username']
    is_pub   = request.form.get('is_public', 'private')

    cursor.execute(
      "INSERT INTO PLAYLIST (p_name, creator, is_public) VALUES (%s, %s, %s)",
      (playlist_name, creator, is_pub)
    )

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
    artist = cursor.fetchone()
    print(artist)
    print(artist['artist'],)
    cursor.execute("SELECT * FROM ALBUM WHERE artist = %s", (artist['artist'],)) #prev version
    albums = cursor.fetchall()

    return render_template('artist.html', artist=artist, albums=albums)
    return render_template('account.html', content="DB Account")

@app.route('/view')
def view():
    return render_template(
        'view.html',
        dbstatus="Connected",
        content=session.get('role')
    )

@app.route('/stats')
def stats():
    if session.get('role') == 'admin':
        return redirect(url_for('admin'))
    
    if session.get('role') == 'user':
        return redirect(url_for('user'))
    
    if session.get('role') == 'artist':
        return redirect(url_for('artist'))
    
    return render_template(
        'view.html',
        dbstatus="Connected",
        content=session.get('role')
    )


@app.route('/admin')
def admin():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    # SystemCounts
    cursor.execute("SELECT * FROM SystemCounts;")
    system_counts = cursor.fetchone()

    # PlaylistPerformance
    cursor.execute("SELECT * FROM PlaylistPerformance;")
    playlist_perf = cursor.fetchall()

    # HourlyStreamCount → prepare data for Chartkick
    cursor.execute("""
      SELECT stream_date, stream_hour, stream_count
        FROM HourlyStreamCount
       ORDER BY stream_date, stream_hour;
    """)
    rows = cursor.fetchall()
    cursor.close()
    conn.close()

    chart_data = [
        [f"{r['stream_date']} {r['stream_hour']}:00", r['stream_count']]
        for r in rows
    ]

    # create a LineChart instance
    chart = LineChart(
        chart_data,
        xtitle="Date & Hour",
        ytitle="Stream Count",
        curve=False,     # straight lines
        points=False     # hide individual points
    )

    return render_template(
        'adminView.html',
        system_counts=system_counts,
        playlist_perf=playlist_perf,
        chart=chart
    )

@app.route('/artist')
def artist():
    role = session.get('role')
    user = session.get('username')
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    if role == 'artist':
        # 1) Compute this artist's global rank by total hours streamed
        cursor.execute("""
          SELECT artist_rank FROM (
            SELECT
              m.a_name                            AS artist_name,
              ROUND(SUM(sl.stream_duration)/3600,2) AS hours_streamed,
              ROW_NUMBER() OVER (
                ORDER BY SUM(sl.stream_duration) DESC
              ) AS artist_rank
            FROM STREAM_LOG sl
            JOIN MAKES m ON sl.song_id = m.song_id
            GROUP BY m.a_name
          ) ranked
          WHERE artist_name = %s
        """, (user,))
        artist_rank = cursor.fetchone().get('artist_rank', None)
        
        # 2) Top 10 songs
        cursor.execute("""
          SELECT song_id, song_name,
                 num_streams  AS total_streams,
                 hours_streamed,
                 avg_pct_listened
            FROM ArtistSongStats
           WHERE artist_name = %s
           ORDER BY hours_streamed DESC
           LIMIT 10
        """, (user,))
        top_songs = cursor.fetchall()

        # Totals across all songs
        cursor.execute("""
          SELECT
            SUM(num_streams)       AS total_streams,
            SUM(hours_streamed)    AS hours_streamed,
            ROUND( AVG(avg_pct_listened), 2 ) AS avg_pct_listened
          FROM ArtistSongStats
          WHERE artist_name = %s
        """, (user,))
        totals = cursor.fetchone()

        # “Others” = everything beyond top 10
        # (we’ll compute these in Python by subtracting)
        others = {
          'total_streams':   totals['total_streams']   - sum(r['total_streams']   for r in top_songs),
          'hours_streamed':  totals['hours_streamed']  - sum(r['hours_streamed']  for r in top_songs),
          'avg_pct_listened': None  # optional: leave blank or compute weighted avg
        }

        # 3) Albums stats (per-album view)
        cursor.execute("""
          SELECT
            al.al_id       AS album_id,
            al.al_title    AS album_title,
            COUNT(sl.log_id)                 AS total_streams,
            ROUND(SUM(sl.stream_duration)/3600,2) AS hours_streamed
          FROM ALBUM al
          JOIN MAKES m  ON al.al_id = m.al_id
          JOIN SONG s   ON m.song_id = s.song_id
          LEFT JOIN STREAM_LOG sl ON s.song_id = sl.song_id
          WHERE m.a_name = %s
          GROUP BY al.al_id, al.al_title
          ORDER BY hours_streamed DESC
        """, (user,))
        albums = cursor.fetchall()

        cursor.close()
        conn.close()

        return render_template(
          'artistView.html',
          name=session.get('username'),
          artist_rank=artist_rank,
          top_songs=top_songs,
          others=others,
          totals=totals,
          albums=albums
        )
    
@app.route('/user')
def user():
    user = session.get('username')

    conn   = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    # 3a) FavoritePlaylists for this user
    cursor.execute("""
      SELECT
        p.p_id,
        p.p_name,
        COUNT(sl.log_id)                    AS num_streams,
        ROUND(SUM(sl.stream_duration)/3600,2) AS hours_streamed,
        ROUND(
          SUM(CASE WHEN sl.skipped='yes' THEN 1 ELSE 0 END)
          / NULLIF(SUM(sl.stream_duration)/3600,0)
        ,2) AS avg_skips_per_hour
      FROM PLAYLIST p
      JOIN STREAM_LOG sl ON p.p_id = sl.p_id
      WHERE sl.user_name = %s
      GROUP BY p.p_id, p.p_name
      ORDER BY hours_streamed DESC
      LIMIT 5;
    """, (user,))
    favorite_playlists = cursor.fetchall()

    # 3b) FavoriteSongs for this user
    cursor.execute("""
      SELECT
        s.song_id,
        s.name        AS song_name,
        sg.genre      AS genre,
        COUNT(*)      AS num_streams,
        ROUND(SUM(sl.stream_duration)/3600,2) AS hours_streamed
      FROM STREAM_LOG sl
      JOIN SONG s    ON sl.song_id = s.song_id
      JOIN S_GENRE sg ON s.song_id = sg.song_id
      WHERE sl.user_name = %s
      GROUP BY s.song_id, sg.genre
      ORDER BY hours_streamed DESC
      LIMIT 15;
    """, (user,))
    favorite_songs = cursor.fetchall()

    # 3c) FavoriteGenres for this user
    cursor.execute("""
      SELECT
        sg.genre,
        COUNT(DISTINCT sl.song_id)           AS num_songs_streamed,
        ROUND(SUM(sl.stream_duration)/3600,2) AS hours_streamed
      FROM STREAM_LOG sl
      JOIN S_GENRE sg ON sl.song_id = sg.song_id
      WHERE sl.user_name = %s
      GROUP BY sg.genre
      ORDER BY hours_streamed DESC
      LIMIT 3;
    """, (user,))
    favorite_genres = cursor.fetchall()

    cursor.close()
    conn.close()

    # 4) Render exactly as before, but now filtered
    return render_template(
      'userView.html',
      favorite_playlists=favorite_playlists,
      favorite_songs=favorite_songs,
      favorite_genres=favorite_genres
    )


if __name__ == '__main__':
    app.run(debug=True)
