<?php
include "../../connect.php";
$ordersid=filterRequest("ordersid");
$usersid=filterRequest("usersid");
$stmt=$con->prepare("SELECT sum(((orderdetails_price- (orderdetails_price*(orderdetails_itemsdiscount/100)) )* orderdetails_qty)+orderdetails_shipping) as totalprice, users.users_name,address.* FROM orderdetails 
INNER JOIN orders ON orders.orders_id=orderdetails.orderdetails_oid 
INNER JOIN items ON items.items_id=orderdetails.orderdetails_itemsid 
INNER JOIN address ON address.address_id=orders.orders_address 
INNER JOIN users ON users.users_id=orders_usersid 
WHERE orders_id= $ordersid AND items.items_usersid= $usersid 
");
$stmt->execute();
$data=$stmt->fetchAll(PDO::FETCH_ASSOC);
$count=$stmt->rowCount();
if($count>0){
    echo json_encode(array("status"=>"success","data"=>$data));

}
else{
    echo json_encode(array("status"=>"failure"));
}
?>