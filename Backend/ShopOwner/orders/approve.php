<?php

include "../../connect.php";

$orderid = filterRequest("ordersid");
$usersid = filterRequest("usersid");
$itemsid = filterRequest("itemsid");

$data = array(
    "orderdetails_approve" => 1
);

updateData("orderdetails",$data,"orderdetails_oid = $orderid AND orderdetails_itemsid = $itemsid AND orderdetails_approve = 0");

insertNotify("success","The order has been Approved",$usersid,"users$usersid","none","refreshorderpending");