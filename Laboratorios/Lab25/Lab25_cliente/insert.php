<?php
if(count($_POST)<=0)
    return;
$h = curl_init();
$s = $_POST["word"];
curl_setopt($h, CURLOPT_URL, "http://localhost/DAW_A01172309/Laboratorios/Lab25/Lab25_servicio/public/words");
curl_setopt($h, CURLOPT_CUSTOMREQUEST, "POST");
curl_setopt($h, CURLOPT_POSTFIELDS, $s);
curl_setopt($h, CURLOPT_HTTPHEADER, array(
        'Content-Type: application/json',
        'Content-Length: ' . strlen($s))
);
$r = curl_exec($h);
curl_close($h);
header("Location: index.php");