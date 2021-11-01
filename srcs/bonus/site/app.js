const http = require('http')
const fs = require('fs')

const server = http.createServer((req, res) => {
  res.writeHead(200, { 'content-type': 'text/html' })
  fs.readFile('/tmp/index.html', 'utf-8', (err, file) => {
    if (err)
      console.log(err);
    else
      res.write(file);
    res.end();
  });
})

server.listen(30001)