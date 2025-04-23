import mysql.connector

mydb = mysql.connector.connect(
    host='localhost',
    user='root',
    password='root',
    port='3306',
    database='CS4604_Crappy_Spotify_Clone'
)

mycursor = mydb.cursor()
mycursor.execute("select * from user")
data = mycursor.fetchall()

for i in data:
    print(i)
