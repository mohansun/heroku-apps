// web.js
var express = require("express");
var logfmt = require("logfmt");

var pg = require('pg');

var app = express();

app.use(logfmt.requestLogger());

app.get('/', function(req, res) {
  res.send('Hello World!');

pg.connect(process.env.DATABASE_URL, function(err, client, done) {
  client.query('SELECT * FROM test1', function(err, result) {
    done();
    if(err) return console.error(err);
    console.log(result.rows);
  });
});

});

var port = process.env.PORT || 5000;
app.listen(port, function() {
  console.log("Listening on " + port);
});
