const express = require('express');
const router = express.Router();

router.get('/',(request, response, next) =>{
    let respuesta = '<!DOCTYPE html><html lang="es-mx"><head><title>Ciencia</title><meta charset="utf-8"></meta></head><body><h1>Amo las mates</h1><main><h2>Aprendamos funciones trigonométricas</p></body></html>';
    response.send(respuesta);
});

router.get('/estrella',(request, response, next) =>{
    let respuesta = '<!DOCTYPE html><html lang="es-mx"><head><title>Ciencia</title><meta charset="utf-8"></meta></head><body><h1>estrella</h1><main><h2>mini star twinkle twinkle</h2></body></html>';
    response.send(respuesta);
});
router.get('/supernova',(request, response, next) =>{
    let respuesta = '<!DOCTYPE html><html lang="es-mx"><head><title>Ciencia</title><meta charset="utf-8"></meta></head><body><h1>supernova</h1><main><h2>big big star</h2></body></html>';
    response.send(respuesta);
});
router.get('/galaxia',(request, response, next) =>{
    let respuesta = '<!DOCTYPE html><html lang="es-mx"><head><title>Ciencia</title><meta charset="utf-8"></meta></head><body><h1>galaxia</h1><main><h2> la via lactea es una galaxia :) </h2></body></html>';
    response.send(respuesta);
});

module.exports = router;