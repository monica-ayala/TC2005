function potencias() {
  let num = prompt("Ingresa hasta que número deseas obtener información", "Ex. 10");
  if (num != null) {
  	str = "";
    for (let i = 0; i < num; i++) {
  		resultado = (i+1)*(i+1);
    	resultado2 = (i+1)*(i+1)*(i+1);
    	str = str + (i+1) + ".- Su cuadrado es: " + resultado + ", Su cubo es: " + resultado2 + "<br>";
	}
    document.getElementById("demo").innerHTML = str;

  }
}

function suma() {
  inicio = new Date();
  num1 = Math.floor(Math.random() * 10);
  num2 = Math.floor(Math.random() * 10);
  str = "¿Cuál es el resultado de la suma "+ num1 + " + " + num2 + "?";
  suma = num1 + num2;
  document.getElementById("instrucción").innerHTML = str;
  let num = prompt(str);
  
  if (num != null) {
  	fin = new Date();
  	if(num == suma){
  		str = "Es correcto";
  	}
  	else{
  		str = "Es incorrecto";
  	}
  	var timeDiff = fin - inicio; //in ms
    timeDiff /= 1000;

  	var seconds = Math.round(timeDiff);
    document.getElementById("suma").innerHTML = str + " <br> el tiempo de respuesta fue de: " + seconds  + " segundos";

  }
}

function negativos(){
	let vec_string = prompt("Escribe los numeros que quieras verificar si son negativos separados por espacios");
	const vec_number = vec_string.split(" ");
	negativos = "";
	ceros = "";
	positivos = "";
	if (vec_string != null) {
		for(let i=0;i<vec_number.length;i++){
		if(vec_number[i]<0){
			negativos = negativos + vec_number[i] + " : es negativo (menor a 0)"+ "<br>";
		}
		else if(vec_number[i]==0){
			ceros = ceros + vec_number[i] + " : son igual a 0" + "<br>";
		}
		else if(vec_number[i]>0){
			positivos = positivos + vec_number[i] + " : es positivo (mayor a 0)"+ "<br>";
		}
	}
		document.getElementById("negativos").innerHTML = negativos + "<br><br>" + ceros + "<br><br>" + positivos;
	}
}

function promedios(){
	let vec_string = prompt("Separa los numeros por espacios y las filas por ; ");
	const vec_rows = vec_string.split(";");
	str = "";

		for(let i=0;i<vec_rows.length;i++){
			suma = 0;
			const vec_number = vec_rows[i].split(" ");
			for(let j=0;j<(vec_rows[i].length+1)/2;j++){
				suma = suma + parseInt(vec_number[j]);
			}
			str = str + vec_rows[i] + "--promedio:" + suma/((vec_rows[i].length+1)/2) + "<br>";
		} 
		document.getElementById("promedios").innerHTML = str;

	}

function inverso(){
	let s = prompt("Ingresa tu número: ");
	const splitString = s.split("");
	var reverseArray = splitString.reverse();
	var str = reverseArray.join("");
	document.getElementById("inverso").innerHTML = str	;

}

function problema(){

let str = prompt("Ingresa la x que deseas para evaluar en f(x)=sin(x)", "Ex. 4");
res=Math.sin(str)
document.getElementById("problema").innerHTML =  "Para x="+str+", f(x)="+res;
}


