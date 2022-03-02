console.log("LABORATORIO 10");
const filesystem = require('fs');
const http = require('http');

const server = http.createServer( (request, response) => {
    
    if (request.url === '/') {
        response.setHeader('Content-Type', 'text/html');
        response.write('<!DOCTYPE html>');
        response.write('<html><head>');
        response.write('<title> MAIN PAGE </title>');
        response.write('</head><body>');
        response.write('<h1 id="principal">Esta es la página princiapl</h1>');
        response.write('</body>');
        response.end();
    } else if (request.url === '/uno') {
        response.setHeader('Content-Type', 'text/html');
        response.write('<!DOCTYPE html>');
        response.write('<html><head>');
        response.write('<title> 1ra página </title>');
        response.write('</head><body>');
        response.write('<h1 id="principal">Esta no es la página principal</h1>');
        response.write('</body>');
        response.end();
    } else if (request.url === '/dos') {
        response.setHeader('Content-Type', 'text/html');
        response.write('<!DOCTYPE html>');
        response.write('<html><head>');
        response.write('<title> 2da página </title>');
        response.write('</head><body>');
        response.write('<h1 id="principal">Esta no es la página principal</h1>');
        response.write('</body>');
        response.end();
    } else if (request.url === '/tres') {
        response.setHeader('Content-Type', 'text/html');
        response.write('<!DOCTYPE html>');
        response.write('<html><head>');
        response.write('<title> 3ra página </title>');
        response.write('</head><body>');
        response.write('<h1 id="principal">Esta no es la página principal</h1>');
        response.write('</body>');
        response.end();
    } else {
        response.statusCode = 404;
        response.setHeader('Content-Type', 'text/html');
        response.write('<!DOCTYPE html>');
        response.write('<html><head>');
        response.write('<title> 404 - no existe la página </title>');
        response.write('</head><body>');
        response.write('<h1 id="principal"> bye bye no hay página</h1>');
        response.write('</body>');
        response.end();
    }
});

server.listen(3000);
