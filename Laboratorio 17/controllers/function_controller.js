const path = require('path');
const filesystem = require('fs');
const Item = require('../models/function');


exports.listar = (request, response, next) =>{
    Item.fetchAll()
    .then(([Item, fieldData]) => {
            response.render('lista', {
                math: Item,
                last_funct: request.cookies.last_funct ? request.cookies.last_funct : '',})
        }).catch(err => console.log(err));
};

exports.get_nuevo = (request, response, next) =>{
    console.log(request.body);
    Item.fetchAll()
        .then(([rows, fieldData]) => {
            response.render('nuevo', {
                math:Function
            })
            
        })
        .catch(err => console.log(err));
};

exports.post_nuevo = (request,response,next) =>{
    const item = new Item(request.body.Function);
    item.save().then(() => {
        response.setHeader('Set-Cookie', 'last_funct='+item.Function+'; HttpOnly', 'utf8');
        response.redirect('/math/');
    }).catch(err => console.log(err));
};