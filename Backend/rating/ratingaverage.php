<?php
include "../connect.php";
$itemsid=filterRequest("itemsid");
$stmt=$con->prepare("SELECT (Sum(rating_rate)/Count(rating_itemsid))as ratingaverage FROM rating WHERE rating_itemsid= $itemsid
GROUP BY rating_itemsid");
$stmt->execute();
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $count = $stmt->rowCount();
    if ($count > 0) {
        echo json_encode(array("status" => "success", "data" => $data));
    } else {
        echo json_encode(array("status" => "failure"));
    }

