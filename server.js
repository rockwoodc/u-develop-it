const express = require('express');
const db = require('./db/connection');
const apiRoutes = require('./routes/apiRoutes');

const PORT = process.env.PORT || 3001;
const app = express();

// Express middleware
app.use(express.urlencoded({ extended: false }));
app.use(express.json());
//use api routes
app.use('/api', apiRoutes);


// Default response for any other request (Not Found)--has to be last
app.use((req, res) => {
    res.status(404).end();
  });

// Start server after DB connection
db.connect(err => {
  if (err) throw err;
  console.log('Database connected.');
//this will start express.js server on port 3001
app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
  });
});

  //returns an array of each row of data--key component to allow SQL commands to be written in node
// db.query(`SELECT * FROM candidates`, (err, rows) => {
//     console.log(rows);
//   });