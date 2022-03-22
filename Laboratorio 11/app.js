const express = require('express');
const app = express();
const bodyParser = require('body-parser');


const scienceruta = require('./routes/science.routes')
const mathruta = require('./routes/math.routes')

app.use(bodyParser.urlencoded({extended: false}));

app.use('/science', scienceruta);
app.use('/math', mathruta);

app.use('/ruta1', (request, response, next) => {
    console.log('Respuesta de la ruta "/ruta1"');
    response.send('Respuesta de la ruta "/ruta1"'); 
});
    
app.use('/ruta2', (request, response, next) => {
    console.log('Respuesta de la ruta "/ruta2"');
    response.send('Respuesta de la ruta "/ruta2"'); 
});
    
app.use('/ruta3', (request, response, next) => {
    console.log('Respuesta de la ruta "/ruta3"');
    response.send('Respuesta de la ruta "/ruta3"'); 
});
    
app.use((request, response, next) => {
    console.log('respuesta a ruta no existente');
    response.status(404)
    response.send('Error 404. No existe esa Ruta.');
});


app.listen(3000);


