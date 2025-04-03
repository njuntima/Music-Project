from flask import Flask, render_template
import mysql.connector
from mysql.connector import Error

app = Flask(__name__)

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

if __name__ == '__main__':
    app.run()
    