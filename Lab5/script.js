function validarContrasena(){
    var clave1 = document.forms["clave"]["clave1"].value;
    var clave2 = document.forms["clave"]["clave2"].value;
    if(clave1.length == 0){
        alert("No has insertado una contraseña.");
        return 0;
    }else if(clave2 !== clave1){
        alert("La segunda contraseña no es igual a la primera.");
        return 0;
    }
    mayus = 0;
    num = 0;
    if(clave1.length >= 6){
        for(var i=0;i<clave1.length;i++){
            if('0123456789'.indexOf(clave1.charAt(i)) !== -1){
                num+=1;
            }else if(clave1.charAt(i) == clave1.charAt(i).toUpperCase()){
                mayus+=1;
            }
        }
        if(mayus < 1){
            alert("La contraseña debe tener al menos una mayuscula.");
            return 0;
        }
        if(num < 1){
            alert("La contraseña debe tener al menos un número.");
            return 0;
        }
        alert("¡Contraseña correcta!");
        return 0;
    }else{
        alert("La contraseña debe tener 6 o más caracteres.");
        return 0;
    }
    alert("Error")
    return 0;
}
function revisionProductos(){
    var platanos = document.forms["numproductos"]["platanos"].value;
    var peras = document.forms["numproductos"]["peras"].value;
    var manzanas = document.forms["numproductos"]["manzanas"].value;
    if(manzanas === "" && platanos == "" && peras == ""){
        alert("No compraste nada.");
        return 0;
    }
    if(manzanas < 0 || peras < 0 || platanos < 0){
        alert("No puedes ingresar numeros menores a 0.");
        return;
    }
    if(manzanas.match(/^[0-9]+$/) == null|| peras.match(/^[0-9]+$/) == null || platanos.match(/^[0-9]+$/) == null){
        alert("Favor de solo insertar numeros.");
        return;
    }
    manzanas = parseInt(manzanas);
    peras = parseInt(peras);
    platanos = parseInt(platanos)
    if(manzanas > 20){
        alert("No hay suficientes manzanas en el almacen.");
        return;
    }else if(platanos > 30){
        alert("No hay suficientes platanos en el almacen.");
        return;
    }else if(peras > 40){
        alert("No hay suficientes peras en el almacen");
        return;
    }
    sum1 = (manzanas*10) + (peras*30) + (platanos*20);
    sum2 = sum1 + (sum1*.15);
    alert("Tú total es de: \n" + sum1 + " más el 15% de IVA: " + sum2);



}