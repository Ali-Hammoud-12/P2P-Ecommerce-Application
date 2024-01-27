<?php
include "../connect.php";
$usersid=filterRequest("usersid");
getAlldata("itemsview","items_usersid=$usersid");
?>