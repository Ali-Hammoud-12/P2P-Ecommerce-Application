<?php
include "../connect.php";
$usersid=filterRequest("usersid");
$stmt=$con->prepare("SELECT items.*,(items_price-(items_price*items_discount/100))as itemspricediscount FROM orderdetails
INNER JOIN items ON items.items_id=orderdetails.orderdetails_itemsid
INNER JOIN orders ON orders.orders_id=orderdetails.orderdetails_oid
WHERE orders_usersid=$usersid
GROUP BY orderdetails_itemsid ");
$stmt->execute();
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $count = $stmt->rowCount();
    if ($count > 0) {
        echo json_encode(array("status" => "success", "data" => $data));
    } else {
        echo json_encode(array("status" => "failure"));
    }
