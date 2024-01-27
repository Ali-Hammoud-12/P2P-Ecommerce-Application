<?php

include "../../connect.php";

$usersid = filterRequest("usersid");

getAllData("items","items_usersid = $usersid AND items_active = 1");

?>