<?php

include "../../connect.php";

$userid = filterRequest("userid");
$stmt=$con->prepare("
SELECT orders.* , items.items_usersid FROM orders
INNER JOIN orderdetails ON orderdetails.orderdetails_oid = orders.orders_id
INNER JOIN items ON items.items_id=orderdetails.orderdetails_itemsid
WHERE items.items_usersid = $userid
GROUP BY orders_id");
$stmt->execute();
$data=$stmt->fetchAll(PDO::FETCH_ASSOC);
$count = $stmt->rowCount();
if($count>0){
echo json_encode(array("status"=>"success","data"=>$data));
}
else{echo json_encode(array("status"=>"failure"));
}
?>