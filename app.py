from flask import Flask, jsonify
import socket
import datetime

app = Flask(__name__)

@app.route('/')
def hello():
    return jsonify({
        "message": "Hello, World!",
        "current_time": str(datetime.datetime.now()),
        "hostname": socket.gethostname()
    })

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
