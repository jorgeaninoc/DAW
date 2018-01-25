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