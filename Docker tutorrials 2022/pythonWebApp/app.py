from flask import Flask
app = Flask(__name__)
#run app:
#python3 -m flask run
#Define root route
@app.route('/')
def hello_world():
    return 'Hello World !!!'