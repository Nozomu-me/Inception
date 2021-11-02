const http = require('http')
const fs = require('fs')
const express = require('express');
// const server = http.createServer((req, res) => {
//   res.writeHead(200, { 'content-type': 'text/html' })
//   fs.readFile('/tmp/index.html', 'utf-8', (err, file) => {
//     if (err)
//       console.log(err);
//     else
//       res.write(file);
//     res.end();
//   });
// })

// http.createServer(function (req, res) {
//   console.log(__dirname + req.url)
//   fs.readFile(__dirname + req.url, function (err,data) {
//     if (err) {
//       console.log(err.message)
//       res.writeHead(404);
//       res.end(JSON.stringify(err));
//       return;
//     }
//     res.writeHead(200);
//     res.end(data);
//   });
// }).listen(8080);

// SELECT * from users where id = 1
// server.listen(30001)

const app = express();

app.use(express.static('public'));

app.listen(30001);