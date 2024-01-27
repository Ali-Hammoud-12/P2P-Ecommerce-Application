<?php
include "../../connect.php";
$usersid = filterRequest("usersid");
$stmt=$con->prepare("Select orders.*,items.items_usersid from orders 
INNER JOIN orderdetails ON orders.orders_id=orderdetails.orderdetails_oid
INNER JOIN items ON orderdetails_itemsid=items.items_id
WHERE items_usersid =$usersid");
$stmt->execute();
$data=$stmt->fetchAll(PDO::FETCH_ASSOC);
$count = $stmt->rowCount();
if($count>0){
json_encode(array("status"=>"success","data"=>$data));
}
else{json_encode(array("status"=>"failure"));
}