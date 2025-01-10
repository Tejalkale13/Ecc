const express = require('express');
const mysql = require('mysql2');

const app = express();
app.use(express.json());

const db = mysql.createConnection({
    host: 'db',
    user: 'user',
    password: 'password',
    database: 'ecommerce'
});

db.connect((err) => {
    if (err) {
        console.error('Database connection failed:', err.stack);
        return;
    }
    console.log('Connected to the database.');
});

// Root route for the service
app.get('/', (req, res) => {
    res.send('<h1>Welcome to the Order Service</h1><p>Use /api/orders to interact with the API.</p>');
});

// Create an order
app.post('/api/orders', (req, res) => {
    const { product_id, quantity } = req.body;

    if (!product_id || !quantity) {
        return res.status(400).json({ error: 'Invalid order data' });
    }

    const query = "INSERT INTO orders (product_id, quantity) VALUES (?, ?)";
    db.query(query, [product_id, quantity], (err, result) => {
        if (err) throw err;
        res.status(201).json({ message: 'Order created', order_id: result.insertId });
    });
});

// Get all orders
app.get('/api/orders', (req, res) => {
    const query = "SELECT * FROM orders";
    db.query(query, (err, results) => {
        if (err) throw err;
        res.status(200).json(results);
    });
});

/*app.get('/api/orders', (req, res) => {
    console.log('GET /api/orders called');
    const query = "SELECT * FROM orders";
    db.query(query, (err, results) => {
        if (err) {
            console.error('Database query error:', err);
            return res.status(500).json({ error: 'Database query failed' });
        }
        console.log('Query results:', results);
        res.status(200).json(results);
    });
});*/


const PORT = 3000;
app.listen(PORT, () => console.log(`Order service running on port ${PORT}`));
