const http = require('http')
const fs = require('fs') // unused
const express = require('express'); // a built-in module allows Node.js to transfer data over the Hyper Text Transfer Protocol (HTTP).
const app = express();

app.use(express.static('public'));

app.listen(30001);
