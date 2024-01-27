<?php
include "connect.php" ;
$address_id=filterRequest("addressid");
$stmt = $con->prepare("SELECT carrier_id,carrier_name FROM address INNER join carrier ON carrier.carrier_country=address.address_country WHERE address_id= $address_id");
$stmt->execute();
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $count = $stmt->rowCount();
    if ($count > 0) {
        echo json_encode(array("status" => "success", "data" => $data));
    } else {
        echo json_encode(array("status" => "failure"));
    }



?>