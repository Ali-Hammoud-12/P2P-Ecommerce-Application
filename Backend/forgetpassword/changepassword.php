<?php

include "../connect.php";

$usersid = filterRequest("usersid");
$password = sha1($_POST['password']) ; 
$data = array("users_password" => $password);
updateData("users", $data, "users_id = '$usersid'");