# app_v1/app.py
from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return """
    <html>
        <body style='background-color: lightblue; text-align: center;'>
            <h1>Application Version 1.0</h1>
            <p>This is the original stable version of the application.</p>
            <p>Served from Version 1</p>
        </body>
    </html>
    """

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)