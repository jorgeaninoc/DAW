function changeColorAndSize(){
    document.getElementById("mouse").style.visibility="red";
    document.getElementById("mouse").style.fontSize="200%"
}
function changeColorAndSize2(){
    document.getElementById("mouse").style.color ="red";
    document.getElementById("moude").style.fontSize="50%"
}
function showPasswordReqs() {
    document.getElementById("reqs").style.height = "100px";
}

document.getElementById("mouse").addEventListener("mouseover",changeColorAndSize);

password = document.getElementById("clave").clave1;
password.onfocus = showPasswordReqs;
password.onblur = function(){
    document.getElementById("reqs").style.height="0";
}

var off = true;
document.getElementById("color").onclick = function(){
    var bod = document.body;
        if(off){
            x = setInterval(function(){off = false; changeBackground();}, 1500);
        }else{
            clearInterval(x);
            bod.style.backgroundColor = "white"
            off = true;
        }
    function changeBackground(){
        var bod = document.body;
        bod.style.backgroundColor = bod.style.backgroundColor == "blue" ? "green" : "blue";
    }
}

function allowDrop(ev) {
    ev.preventDefault();
}

function drag(ev) {
    ev.dataTransfer.setData("text", ev.target.id);
}

function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    ev.target.appendChild(document.getElementById(data));
}