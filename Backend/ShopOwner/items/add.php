<?php

include_once "../../connect.php";

$table = 'items';

$name = filterRequest("name");
$user = filterRequest("uid");
$description = filterRequest("desc");
$quantity = filterRequest("count");
$active = filterRequest("active");
$price = filterRequest("price");
$shippingprice = filterRequest("sprice");
$discount = filterRequest("discount");
$imagename = imageUpload("../../upload/items","files");
$catid = filterRequest("catid");


// $date = date("Y-m-d H:i:s");

$data =array(

    "items_name" => $name,
    "items_usersid" => $user,
    "items_description" => $description,
    "items_quantity" => $quantity,
    "items_active" => $active,
    "items_price" => $price,
    "items_shippingprice" => $shippingprice,
    "items_discount" => $discount,
    "items_image" => $imagename,
    "items_cid" => $catid,


);
insertData($table,$data);

?>