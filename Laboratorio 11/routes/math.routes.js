const express = require('express');
const router = express.Router();

router.get('/',(request, response, next) =>{
    let respuesta = '<!DOCTYPE html><html lang="es-mx"><head><title>Mate</title><meta charset="utf-8"></meta></head><body><h1>Amo las mates</h1><main><h2>Aprendamos funciones trigonométricas</p></body></html>';
    response.send(respuesta);
});

router.get('/tangente',(request, response, next) =>{
    let respuesta = '<!DOCTYPE html><html lang="es-mx"><head><title>Mate</title><meta charset="utf-8"></meta></head><body><h1> tan x = sen x/cos x</h1></body></html>';
    response.send(respuesta);
});
router.get('/secante',(request, response, next) =>{
    let respuesta = '<!DOCTYPE html><html lang="es-mx"><head><title>Mate</title><meta charset="utf-8"></meta></head><body><h1>Secante</h1><main><h2>sec x = 1/cos x</h2></body></html>';
    response.send(respuesta);
});
router.get('/coseno',(request, response, next) =>{
    let respuesta = '<!DOCTYPE html><html lang="es-mx"><head><title>Mate</title><meta charset="utf-8"></meta></head><body><h1>Coseno</h1><main><h2> cos cos cosenoo :) </h2></body></html>';
    response.send(respuesta);
});

module.exports = router;