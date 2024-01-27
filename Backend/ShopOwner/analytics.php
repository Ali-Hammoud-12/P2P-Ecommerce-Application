<?php
include "../connect.php";
$usersid=filterRequest("usersid");
$stmt=$con->prepare("Select sum(((orderdetails_price- (orderdetails_price*(orderdetails_itemsdiscount/100)) )* orderdetails_qty)+orderdetails_shipping ) as total,items.items_name ,items.items_image
  from orderdetails INNER join orders on orders.orders_id = orderdetails.orderdetails_oid 
  INNER JOIN items on items.items_id = orderdetails.orderdetails_itemsid 
  INNER JOIN users on items.items_usersid = users.users_id 
  WHERE items.items_usersid=$usersid
  group by  items.items_id");
$stmt->execute();
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $count = $stmt->rowCount();
    if ($count > 0) {
        echo json_encode(array("status" => "success", "data" => $data));
    } else {
        echo json_encode(array("status" => "failure"));
    }

