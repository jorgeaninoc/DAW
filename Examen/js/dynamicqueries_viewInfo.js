$(document).ready(function(){
    $("input").each(function(){
        $(this).keyup(function(event){
            if(event.keyCode == 13)
                event.preventDefault();
        });
            $.post("controller/entradaSearch_controller.php",{
               entrada :
                {
                }
            },
            function(data,status){
                $("#entrada_table").html(data);
                readyForDisplay();
            });
        
    });

    $("select").each(function(){
        $(this).change(function(){
            $.post("controller/entradaSearch_controller.php",{
                    entrada :
                        {
                        }
                },
                function(data,status){
                    $("#entrada_table").html(data);
                    readyForDisplay();
                });
        });
    });

    $(".creload").click(function(){
        location.reload();
    });

    function readyForDisplay(){
        var r = $("tbody").find("tr");
        if(r.length){
            r.each(function(){
                $(this).click(function(){
                    var c = $(this).find("td").toArray();
                    if(c.length>1){
                        var inputs = $("form").first().find("input").toArray();
                        var i;
                        for(i = 0; i<inputs.length; i++){
                            inputs[i].value = c[i].innerText;
                        }
                        var selects = $("select").toArray();
                        $.viewMode();
                    }
                });
            });
        }
    }



});
