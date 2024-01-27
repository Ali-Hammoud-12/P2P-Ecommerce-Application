<?php

include "../connect.php";

$userid = filterRequest("usersid");

$data  = getAllData("cartview", "cart_usersid = $userid", null, false);

$stmt = $con->prepare("SELECT SUM(itemsprice) as totalprice , Sum(countitems) as totalcount,SUM(items_shippingprice)as shippingprice,SUM(itemsprice)+SUM(items_shippingprice)as total FROM `cartview`  
WHERE  cartview.cart_usersid =  $userid 
GROUP BY cart_usersid  ");

$stmt->execute();


$datacountprice = $stmt->fetch(PDO::FETCH_ASSOC);

echo json_encode(array(
    "status" => "success",
    "countprice" =>  $datacountprice,
    "datacart" => $data,
));