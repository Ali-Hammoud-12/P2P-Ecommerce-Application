<?php

include_once "../../connect.php";
$table = 'items';

$id = filterRequest("id");

$name = filterRequest("name");
$user = filterRequest("uid");
$description = filterRequest("desc");
$quantity = filterRequest("count");
$active = filterRequest("active");
$price = filterRequest("price");
$shippingprice = filterRequest("sprice");
$discount = filterRequest("discount");
$catid = filterRequest("catid");

$res = imageUpload("../../upload/items","files");
$imageold = filterRequest("imageold");

if($res == "empty"){
    $data =array(

        "items_name" => $name,
        "items_usersid" => $user,
        "items_description" => $description,
        "items_quantity" => $quantity,
        "items_active" => $active,
        "items_price" => $price,
        "items_image" => $res,
        "items_shippingprice" => $shippingprice,
        "items_discount" => $discount,
        "items_cid" => $catid,
    
    );

}else{
    deleteFile("../../upload/items",$imageold); 
    $data =array(

        "items_name" => $name,
        "items_usersid" => $user,
        "items_description" => $description,
        "items_quantity" => $quantity,
        "items_active" => $active,
        "items_price" => $price,
        "items_shippingprice" => $shippingprice,
        "items_discount" => $discount,
        "items_image" => $res,
        "items_cid" => $catid,
    

    );
}

updateData($table,$data,"items_id = $id");

?>

