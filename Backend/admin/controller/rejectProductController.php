<?php

require_once "../config/dbconnect.php";

if(isset($_POST['item_id'])) {

    $item_id = $_POST['item_id'];
    $query = "DELETE FROM pending_items where items_id='$item_id'";
        $result = mysqli_query($conn, $query);
        if(!$result){
            echo "error rejecting products.";
            die("Error deleting record: " . mysqli_error($conn));
        } else {
            echo "Product has been rejected.";
        }

}


?>