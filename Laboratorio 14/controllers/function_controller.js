const path = require('path');
const filesystem = require('fs');
const Item = require('../models/function');


exports.listar = (request, response, next) =>{
    console.log(request.body)
    console.log(request.cookies);
    response.render('lista',{
        math: Item.fetchAll(),
        last_funct: request.cookies.last_funct? request.cookies.last_funct: ''  
    });
};

exports.get_nuevo = (request, response, next) =>{
    console.log(request.body);
    response.render('nuevo',{Function:"Csc x"})
};

exports.post_nuevo = (request,response,next) =>{
    console.log(request.body);
    const Item = new item(request.body.Function);
    Item.save();
    filesystem.writeFileSync('Functions.txt', request.body.Function)
    response.status(303);
    response.setHeader('Set-Cookie','last_funct='+Item.Function)
    request.cookies.last_funct=Item.Function;
    response.redirect('/math/');
};