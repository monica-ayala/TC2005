const express = require('express');
const router = express.Router();
const filesystem = require('fs');
const path = require('path');
const math = [{Function:"sin x"}, {Function: "cos x"}
]; 


router.get('/Alex', (request, response, next) => {
    response.sendFile(path.join(__dirname, '..', 'views', 'Alex.html'));
});

router.get('/',(request, response, next) =>{
    response.render('lista', {math:math});
});

router.get('/nuevo',(request, response, next) =>{
    response.render('nuevo',{Function:'tan x'})
});

router.post('/nuevo',(request,response,next) =>{
    console.log(request.body);
    math.push({Function: request.body.Function});
    console.log(math);
    filesystem.writeFileSync('Functions.txt', request.body.Function)
    response.status(303);
    response.redirect('/math/');
});

module.exports = router;