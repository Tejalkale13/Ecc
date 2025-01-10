from flask import Flask, request, jsonify, render_template
import mysql.connector

app = Flask(__name__)

# Database Configuration
db_config = {
    "host": "db",
    "user": "user",
    "password": "password",
    "database": "ecommerce"
}

# Database connection
def get_db_connection():
    return mysql.connector.connect(**db_config)

# Frontend: Home Page
@app.route ('/')
def index():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT id, name, price FROM products")
    products = cursor.fetchall()
    conn.close()
    return render_template('index.html', products=products)

# REST API: Fetch Products
@app.route('/api/products', methods=['GET'])
def get_products():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT id, name, price FROM products")
    products = cursor.fetchall()
    conn.close()
    return jsonify(products)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
