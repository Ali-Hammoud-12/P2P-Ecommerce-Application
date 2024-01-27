<?php

include "connect.php";

$usersid = filterRequest("usersid");

getAllData("users","users_id = $usersid");

?>