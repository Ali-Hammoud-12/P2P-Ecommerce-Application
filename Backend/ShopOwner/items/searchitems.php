<?php
include '../../connect.php';
$search=filterRequest("search");
$userid = filterRequest("userid");
getAllData("items","items_name LIKE '%$search%' AND items_usersid = $userid AND items_active = 0");


?>