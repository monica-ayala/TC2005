const db = require('../util/database');
const bcrypt = require('bcryptjs');

module.exports = class User {

    constructor(nuevo_nombre, nuevo_username, nuevo_password) {
        this.nombre = nuevo_nombre;
        this.username = nuevo_username;
        this.password = nuevo_password;
    }

    save() {
        return bcrypt.hash(this.password, 12)
            .then((password_cifrado)=>{
                return db.execute(
                    'INSERT INTO usuarios(nombre, username, password) VALUES(?,?,?)',
                    [this.nombre, this.username, password_cifrado]);
            }).catch((error)=>{
                console.log(error);
            }); 
    }

    static findOne(username) {
        return db.execute('SELECT * FROM usuarios WHERE username=?',
            [username]);
    }

}