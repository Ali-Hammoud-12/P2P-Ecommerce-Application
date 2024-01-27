<?php

require_once "../config/dbconnect.php";

if(isset($_POST['item_id'])) {
    $item_id = $_POST['item_id'];
    $accepted_product = "SELECT * FROM pending_items where items_id='$item_id'";
    $row = mysqli_fetch_assoc(mysqli_query($conn, $accepted_product));
    $sql = "INSERT INTO items (items_id, items_name, items_description, items_quantity, items_image, items_active, items_price, items_discount, items_cid) VALUES ('".$row['items_id']."', '".$row['items_name']."', '".$row['items_description']."', '".$row['items_quantity']."', '".$row['items_image']."', '".$row['items_active']."', '".$row['items_price']."', '".$row['items_discount']."', '".$row['items_cid']."')";

    $result2 = mysqli_query($conn, $sql);
    if(!$result2){
        die("Error accepting product: " . mysqli_error($conn));
    } else {
        $query = "DELETE FROM pending_items where items_id='$item_id'";
        $result = mysqli_query($conn, $query);
        if(!$result){
            echo "error deleting products.";
            die("Error deleting record: " . mysqli_error($conn));
        } else {
            echo "Product has been accepted.";
        }
    }
}

?>