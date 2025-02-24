require('dotenv').config();
const express = require('express');
const path = require('path');
const mysql = require('mysql');
const bodyParser = require('body-parser');
const bcrypt = require('bcrypt');  // For password hashing

const app = express();
const port = process.env.PORT || 4000;

// Serve static files from the current directory
app.use(express.static(__dirname));

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

// Set up MySQL connection
const connection = mysql.createConnection({
    host: process.env.DB_HOST || 'localhost',
    user: process.env.DB_USER || 'root',
    password: process.env.DB_PASSWORD || '',
    database: process.env.DB_NAME || 'luxdatabase'
});

connection.connect(err => {
    if (err) {
        console.error('Error connecting to the database:', err);
        return;
    }
    console.log('Connected to the MySQL database.');
});

// Serve the homepage
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'index.html'));
});

// Serve the contact page
app.get('/contact.html', (req, res) => {
    res.sendFile(path.join(__dirname, 'contact.html'));
});

// Handle flight request form submission
app.post('/flight_requests', (req, res) => {
    const { flyFrom, flyTo, selectDate, selectTime, selectPassenger, selectAircraft } = req.body;

    console.log('Form data received:', req.body);

    if (!flyFrom || !flyTo || !selectDate || !selectTime || !selectPassenger || !selectAircraft) {
        console.error('Form data missing or invalid:', req.body);
        res.status(400).send('Invalid form data. Please check all fields and try again.');
        return;
    }

    const query = 'INSERT INTO flight_requests (flyFrom, flyTo, selectDate, selectTime, selectPassenger, selectAircraft) VALUES (?, ?, ?, ?, ?, ?)';
    
    connection.query(query, [flyFrom, flyTo, selectDate, selectTime, selectPassenger, selectAircraft], (error, results) => {
        if (error) {
            console.error('Error inserting data into the database:', error.sqlMessage || error);
            res.status(500).send('Error saving your flight request. Please try again later.');
            return;
        }
        console.log('Flight request saved successfully:', results);
        res.send('Thank you for your flight request!');
    });
});

// Handle newsletter subscription form submission
app.post('/newsletter_subscriptions', (req, res) => {
    const { email } = req.body;

    console.log('Subscription data received:', req.body);

    if (!email) {
        console.error('Email is missing or invalid:', req.body);
        res.status(400).send('Invalid email. Please check and try again.');
        return;
    }

    const query = 'INSERT INTO newsletter_subscriptions (email) VALUES (?)';
    
    connection.query(query, [email], (error, results) => {
        if (error) {
            console.error('Error inserting data into the database:', error.sqlMessage || error);
            res.status(500).send('Error saving your subscription. Please try again later.');
            return;
        }
        console.log('Subscription saved successfully:', results);
        res.send('Thank you for subscribing to our newsletter!');
    });
});

// Handle contact form submission
app.post('/contact_us', (req, res) => {
    const { name, email, phone, subject, message } = req.body;

    console.log('Contact form data received:', req.body);

    if (!name || !email || !phone || !subject || !message) {
        console.error('Form data missing or invalid:', req.body);
        res.status(400).send('Invalid form data. Please check all fields and try again.');
        return;
    }

    const query = 'INSERT INTO contact_us (name, email, phone, subject, message) VALUES (?, ?, ?, ?, ?)';
    
    connection.query(query, [name, email, phone, subject, message], (error, results) => {
        if (error) {
            console.error('Error inserting data into the database:', error.sqlMessage || error);
            res.status(500).send('Error saving your contact request. Please try again later.');
            return;
        }
        console.log('Contact request saved successfully:', results);
        res.send('Thank you for contacting us!');
    });
});

// Handle combined booking form submission
app.post('/bookticket', (req, res) => {
    const {
        firstName, lastName, city, zipCode, email, phone,
        country, destination, luggage, boardingDate, notes, num_passengers, emergency_contact
    } = req.body;

    // Check if all fields are provided
    if (!firstName || !lastName || !city || !zipCode || !email || !phone || 
        !country || !destination || !luggage || !boardingDate || !emergency_contact) {
        console.error('Missing required fields:', req.body);
        return res.status(400).send('Missing required fields.');
    }

    // Insert Customer Information
    const customerQuery = `INSERT INTO customerinformation 
        (firstName, lastName, city, zipCode, email, phone)
        VALUES (?, ?, ?, ?, ?, ?)`;

    connection.query(customerQuery, [firstName, lastName, city, zipCode, email, phone], (error, customerResults) => {
        if (error) {
            console.error('Error saving customer info:', error);
            return res.status(500).send('Error saving customer information.');
        }

        // Insert Boarding Pass Details
        const boardingQuery = `INSERT INTO boardingpassdetails 
            (country, destination, luggage, boardingDate, notes, num_passengers, emergency_contact)
            VALUES (?, ?, ?, ?, ?, ?, ?)`;

        connection.query(boardingQuery, [country, destination, luggage, boardingDate, notes, num_passengers, emergency_contact], (error, boardingResults) => {
            if (error) {
                console.error('Error saving boarding details:', error);
                return res.status(500).send('Error saving boarding pass details.');
            }

            console.log('Both forms submitted successfully.');
            res.send('Your ticket has been booked successfully!');
        });
    });
});

// ==================== USER REGISTRATION ==================== //
app.post('/register', async (req, res) => {
    const { name, email, password } = req.body;

    if (!name || !email || !password) {
        return res.status(400).send('Please fill in all fields.');
    }

    // Check if user already exists
    const checkQuery = 'SELECT * FROM users WHERE email = ?';
    connection.query(checkQuery, [email], async (err, results) => {
        if (err) {
            console.error('Database error:', err);
            return res.status(500).send('Server error.');
        }

        if (results.length > 0) {
            return res.status(409).send('Email already exists. Please login.');
        }

        // Hash the password
        const hashedPassword = await bcrypt.hash(password, 10);

        // Insert new user
        const insertQuery = 'INSERT INTO users (name, email, password) VALUES (?, ?, ?)';
        connection.query(insertQuery, [name, email, hashedPassword], (err, results) => {
            if (err) {
                console.error('Error inserting user:', err);
                return res.status(500).send('Error registering user.');
            }

            console.log('User registered:', results);
            res.redirect('/cart.html');  // Redirect to login page after successful registration
        });
    });
});

// ==================== USER LOGIN ==================== //
app.post('/login', (req, res) => {
    const { email, password } = req.body;

    if (!email || !password) {
        return res.status(400).send('Please enter both email and password.');
    }

    // Find user by email
    const query = 'SELECT * FROM users WHERE email = ?';
    connection.query(query, [email], async (err, results) => {
        if (err) {
            console.error('Database error:', err);
            return res.status(500).send('Server error.');
        }

        if (results.length === 0) {
            return res.status(401).send('Invalid email or password.');
        }

        const user = results[0];

        // Compare passwords
        const isMatch = await bcrypt.compare(password, user.password);
        if (!isMatch) {
            return res.status(401).send('Invalid email or password.');
        }

        console.log('User logged in:', user.email);
        res.redirect('/checkout.html');  // Redirect to checkout after successful login
    });
});

app.get('/confirmation.html', (req, res) => {
    res.sendFile(path.join(__dirname, 'confirmation.html'));
});

// Start the server
app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});
