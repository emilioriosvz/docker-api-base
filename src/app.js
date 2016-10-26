var express = require('express')
var logger = require('morgan')
var bodyParser = require('body-parser')
var routes = require('./routes/index')
var app = express()
var mongoose = require('mongoose')
// Database connect
mongoose.connect('mongodb://mongodb/database')

app.use(logger('dev'))
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: false }))

// Routes
app.use('/', routes)

app.listen(3000, function () {
  console.log('Listening on port 3000')
})

