<?php
include "../connect.php";
$orders_id=filterRequest("ordersid");
$stmt=$con->prepare("SELECT orderdetails.orderdetails_qty,items.items_name,(orderdetails.orderdetails_price-orderdetails.orderdetails_price*orderdetails.orderdetails_itemsdiscount/100)*orderdetails.orderdetails_qty as price,orderdetails.orderdetails_image,orderdetails.orderdetails_approve,address.*,
users.users_name FROM orderdetails
INNER JOIN orders ON orders.orders_id=orderdetails.orderdetails_oid
INNER JOIN items ON items.items_id=orderdetails.orderdetails_itemsid
INNER JOIN address ON address.address_id=orders.orders_address 
INNER JOIN users ON users.users_id=items.items_usersid
WHERE orders_id= $orders_id ");
$stmt->execute();
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $count = $stmt->rowCount();
    if ($count > 0) {
        echo json_encode(array("status" => "success", "data" => $data));
    } else {
        echo json_encode(array("status" => "failure"));
    }

