<?php 
session_start();
if (!isset($_SESSION['start_time']))
{
    $str_time = time();
    $_SESSION['start_time'] = $str_time;
}
?>