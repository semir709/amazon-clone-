
const express = require('express');
const authRouter = require('./routes/auth.js');
require('dotenv').config()
const mongoose = require('mongoose');


const PORT = 3000;
const app = express();

//middleware
app.use(express.json());
app.use(authRouter);


mongoose.connect(process.env.URLDB)
    .then(() => {
        console.log('Connection succesfull')
    }).catch((e) => {
        console.log(e);
    })


app.listen(PORT, "0.0.0.0", () => {
    console.log('Server is running')
});