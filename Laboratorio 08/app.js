console.log("LABORATORIO 8");

const filesystem = require('fs');

const prompt = require('prompt-sync')();

const name = prompt('Escribe lo que deseas visualizar');
  filesystem.writeFileSync('hola.txt', name);
 


const arreglo = [5000, 60, 90, 100, 10, 20, 10000, 0, 120, 2000, 340, 1000, 50];
var suma = 0;

console.log("El promedio del siguiente array: [5000, 60, 90, 100, 10, 20, 10000, 0, 120, 2000, 340, 1000, 50]");
for (let item of arreglo) {
    suma = suma + item;
} 
console.log(suma/arreglo.length);

console.log("Obtener la raíz cuadrada de cada item en el siguiente arreglo: [5000, 60, 90, 100, 10, 20, 10000, 0, 120, 2000, 340, 1000, 50]");

const newArr = arreglo.map(Math.sqrt);
for (let item of newArr) {
    console.log(item);
} 


