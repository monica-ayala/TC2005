const db = require('../util/database');


module.exports = class Item {
    constructor(new_funct){
        this.Function =new_funct;
    }
    save(){
        return db.execute('INSERT INTO Item (Function) VALUE (?)',
        [this.Function])
    }
    static fetchAll(){
        return db.execute('SELECT * FROM Item')
    }
}