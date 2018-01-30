function run(opcion){
    if(opcion == 1){
        var n = prompt("Inserta un numero:");
        tablaDePotencias(n);
    }else if(opcion == 2){
    sumaAleatoria();
    }else if(opcion == 3){
        var len = parseInt(prompt("Inserta el numero de elementos que deseas en el arreglo:"));
        var arreglo = new Array();
        for(var i = 0; i < len; i++){
            arreglo[i] = parseInt(prompt("Ingresa el " + (i+1) + " numero que deseas meter:"));
        }
        contador(arreglo);
    }else if(opcion == 4){
        var rows = parseInt(prompt("Inserta el numero de filas de tu matriz:"));
        var cols = parseInt(prompt("Inserta el numero de columnas de tu matriz:"));
        var matriz = new Array();
        for(var i = 0; i<rows;i++){
            matriz[i] = new Array();
            for(var j = 0; j< cols;j++){
                matriz[i][j] = parseInt(prompt("Ingresa el " + (j+1) + " numero que deseas meter en la fila " + i +":"));
            }
        }
        promedios(matriz);
    }else if(opcion == 5){
        var numero = prompt("Inserta el numero a invertir:");
        inverso(numero);
    }else if(opcion == 6){
        var palabra1 = prompt("Inserta la palabra:");
        hq9(palabra1)
    }
}

function tablaDePotencias(n){
    var table = "<table><thead><th>Numero</th><th>Cuadrado</th><th>Cubo</th></thead>";
    table += "<tr><td>---------</td><td>---------</td><td>---------</td></tr>";
    for(var i = 1;i<=n;i++){
       table+="<tr><td>" + i + "</td>";
       table+="<td>" + Math.pow(i,2) + "</td>";
       table+="<td>" + Math.pow(i,3) + "</td>";
       table+="</tr>";
    }
    document.write(table);
}

function sumaAleatoria(){
    n = Math.floor((Math.random() * 10000) + 1);
    n1 = Math.floor((Math.random() * 10000) + 1);
    var startTime = new Date();
    var n2 = prompt("Cual es el resultado de: \n" + n + " + " + n1);
    var endTime = new Date();
    var totalTime = Math.round(((endTime - startTime)/1000)) ;
    if(n2 == (n+n1)){
       alert("Correcto! " + n2 +"\nTe tardaste: " + totalTime + " segundos.");
    }else{
        alert("El resultado era: " + (n+n1) + "\nTe tardaste: " + totalTime + " segundos." );
    }
}
function contador(arreglo){
    var cero = 0;
    var mayoracero = 0;
    var negativos = 0;
    for(var i = 0; i < arreglo.length;i++){
        if(arreglo[i] > 0){
            mayoracero++;
        }else if(arreglo[i] < 0){
            negativos++;
        }else{
            cero++;
        }
    }
    alert("Numeros en el arreglo\nMayores a cero: "+ mayoracero + "\nCeros: " + cero + "\nNegativos: " + negativos);
}
function promedios(matriz){
    var arreglo = new Array();
    for(var i = 0; i < matriz.length;i++){
        arreglo[i] = 0;
        for(var j = 0; j < matriz[i].length;j++){
            arreglo[i] += matriz[i][j]
        }
        arreglo[i]/=matriz[i].length;
    }
    var table = "<table><thead><th>Fila</th><th>Promedio</th></thead>";
    table += "<tr><td>---------</td><td>---------</td><td>---------</td></tr>";
    for(var i = 0;i<matriz.length;i++){
       table+="<tr><td>" + (i+1) + "</td>";
       table+="<td>" +  arreglo[i] + "</td>";
       table+="</tr>";
    }
    document.write(table);

}
function inverso(numero){
    var x = numero.length;
    var numeroinvertido = "";
    while(x>=0){
        numeroinvertido += numero.charAt(x);
        x--;
    }
    alert("El numero invertido es: " + numeroinvertido);
}

function hq9(palabra){
    clase = new Object();
    clase.respuesta = function respuesta(n){
        if(n){
            alert("YES");
        }else{
            alert("NO");
        }
    }
    clase.esValido = function esValido(palabra){
        for(var i=0;i<palabra.length;i++){
            if(palabra.charAt(i) == "Q" || palabra.charAt(i) == "H" || palabra.charAt(i) == "9"){
                clase.respuesta(true)
                break
            }
        }
        clase.respuesta(false)
    }
    clase.esValido(palabra);
}