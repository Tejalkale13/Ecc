from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return """
    <html>
        <body style='background-color: lightgreen; text-align: center;'>
            <h1>Application Version 2.0</h1>
            <p>This is the new version with enhanced features.</p>
        </body>
    </html>
    """

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5001)