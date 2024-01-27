<?php

$server = "localhost";
$user = "id20430511_houssamali";
$password = "!Houssam1234";
$db = "id20430511_senior_proj";

$conn = mysqli_connect($server,$user,$password,$db);

if(!$conn) {
    die("Connection Failed:".mysqli_connect_error());
}

?>