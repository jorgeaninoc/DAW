<?php
include("idx.html");
//GET

$h = curl_init();
curl_setopt($h, CURLOPT_URL, "http://localhost/DAW_A01172309/Laboratorios/Lab25/Lab25_servicio/public/words");
curl_setopt($h, CURLOPT_RETURNTRANSFER, true);
$r = json_decode(curl_exec($h));
curl_close($h);
for($i=0;$i<count($r);$i++){
    echo $r[$i][0].". ".$r[$i][1]."<br>";
}
echo "</div></body></html>";