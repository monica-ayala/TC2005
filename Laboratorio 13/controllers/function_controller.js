const path = require('path');
const filesystem = require('fs');
const item = require('../models/function');


exports.listar = (request, response, next) =>{
    console.log(request.body)
    response.render('lista', {math: item.fetchAll()});
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
    response.redirect('/math/');
};