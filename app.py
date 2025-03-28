from flask import Flask

app = Flask(__name__)
@app.route('/')
def db():
    return "db project"

if __name__ == '__main__':
    app.run()
    