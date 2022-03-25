const math = [
    {Function:"sin x"}, {Function:"tan x"}
    ]; 
    
    module.exports = class Item {
        constructor(new_funct){
            this.Function =new_funct;
        }
        save(){
            math.push(this);
            console.log(math);
        }
        static fetchAll(){
            return math;
        }
    }