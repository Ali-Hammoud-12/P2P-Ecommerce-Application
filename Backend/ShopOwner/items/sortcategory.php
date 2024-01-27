<?php

include "../../connect.php";

$sort = filterRequest("category");

$stmt=$con->prepare(
    "SELECT * FROM items INNER JOIN categories WHERE items_cid = categories_id AND categories_name = $sort");
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