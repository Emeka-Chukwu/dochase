require('dotenv').config();
const path = require('path');

// express
const express = require('express');
const app = express();
const mongoose = require('mongoose');

app.use(express.json());


// CORS
app.use((req, res, next) => {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, PATCH, DELETE');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');
  next();
});

app.set("view engine", "ejs");
///// routes

const adminRoutes = require("./routes/admin");
const eventRoutes = require("./routes/events");
const attendeeRoute = require("./routes/attendees");


app.use("/api/admin",adminRoutes );
app.use("/api", eventRoutes);
app.use("/api/attendee", attendeeRoute);
app.use("/", (req,res)=>res.status(200).send({message: "wellcome, server is up"}))
// error handler
app.use((err, req, res, next) => {
  console.log('========== app.js error handler ==========\n', err.message);
  const errStatus = err.statusCode || 500;
  const errMsg = err.message;
  const errData = err.data;
  res.status(errStatus).json({errMsg, data:errData, err});
});


const port = process.env.PORT || 3000;
mongoose
  .connect(process.env.DEV_MONGODB_URI, {useNewUrlParser: true,  useUnifiedTopology: true})
  .then(result => {
    const server = app.listen(port, () => console.log(`Easysend server running on ${port}...`));
  })
  .catch(err =>{ 
    console.log(err, "err");
    // next(err);
  });