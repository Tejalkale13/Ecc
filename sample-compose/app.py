from flask import Flask
import mysql.connector

app = Flask(__name__)

@app.route("/")
def home():
    return "Welcome to the Backend Service!"

@app.route("/db-test")
def db_test():
    try:
        conn = mysql.connector.connect(
            host="db",
            user="user",
            password="password",
            database="mydatabase"
        )
        cursor = conn.cursor()
        cursor.execute("SHOW TABLES")
        tables = cursor.fetchall()
        conn.close()
        return {"tables": tables}
    except Exception as e:
        return {"error": str(e)}

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5001)
