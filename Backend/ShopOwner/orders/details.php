<?php
include "../../connect.php";
$ordersid=filterRequest("ordersid");
$usersid=filterRequest("usersid");
$stmt=$con->prepare("SELECT orderdetails.orderdetails_qty,orderdetails.orderdetails_itemsid,orderdetails.orderdetails_approve,orderdetails.orderdetails_oid,users.users_id,items.items_name,sum(((orderdetails_price- (orderdetails_price*(orderdetails_itemsdiscount/100)) )* orderdetails_qty)+orderdetails_shipping ) as totalprice,orderdetails.orderdetails_image, users.users_name FROM orderdetails INNER JOIN orders ON orders.orders_id=orderdetails.orderdetails_oid INNER JOIN items ON items.items_id=orderdetails.orderdetails_itemsid INNER JOIN address ON address.address_id=orders.orders_address INNER JOIN users ON users.users_id=orders_usersid WHERE orders_id= $ordersid AND items.items_usersid= $usersid GROUP BY items_id;");
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
