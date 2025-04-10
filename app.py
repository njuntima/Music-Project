from flask import Flask, render_template, url_for, redirect, request
import mysql.connector
from mysql.connector import Error

app = Flask(__name__, template_folder='assets/templates', static_folder='assets/static')


@app.route('/')
def db():
    try:
        connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="CS4604",
            database="CS4604_Crappy_Spotify_Clone"
        )

        return render_template('index.html', dbstatus="DB Connected")

    except Exception as e:

        return render_template('index.html', dbstatus="DB Connection Failed")

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
