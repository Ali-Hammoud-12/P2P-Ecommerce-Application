<?php
include "../connect.php";
$usersid=filterRequest("usersid");
getAllData("ordersview","orders_usersid=$usersid");