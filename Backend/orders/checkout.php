<?php

include "../connect.php";

$usersid = filterRequest("usersid");
$addressid = filterRequest("addressid");
$shippingprice = filterRequest("shippingprice");
$ordersprice = filterRequest("ordersprice");
$paymentmethod = filterRequest("paymentmethod");
$carrierid=filterRequest("carrierid");
$total=filterRequest("total");


$data = array(
    "orders_usersid"  =>  $usersid,
    "orders_address"  =>  $addressid,
    "orders_shippingprice"  =>  $shippingprice,
    "orders_price"  =>  $ordersprice,
    "orders_paymentmethod"  =>  $paymentmethod,
    "orders_carrierid"  =>  $carrierid,
    "orders_total"  =>  $total,
);

$count = insertData("orders", $data, false);

if ($count > 0) {

    $stmt = $con->prepare("SELECT MAX(orders_id) from orders ");
    $stmt->execute();
    $maxid = $stmt->fetchColumn();

    $data = array("cart_orders" => $maxid);

    updateData("cart", $data, "cart_usersid = $usersid  AND cart_orders = 0 ");

    $stmt = $con->prepare("insert into orderdetails(orderdetails_oid,orderdetails_itemsid,orderdetails_qty,orderdetails_image,orderdetails_price,orderdetails_shipping,orderdetails_itemsdiscount)
     SELECT $maxid ,cart.cart_itemsid ,COUNT(cart.cart_itemsid),items.items_image,items.items_price,items.items_shippingprice,items.items_discount FROM cart
     INNER JOIN items ON items.items_id=cart.cart_itemsid
     WHERE cart.cart_orders=$maxid GROUP BY cart.cart_itemsid");
     $stmt->execute();

}


