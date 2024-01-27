<?php
require_once "../config/dbconnect.php";
    $u_id = $_GET['u_id'];
$query="Delete FROM items WHERE items_id=$u_id";
$result=mysqli_query($conn,$query);
 if(!$result){
        die("Error deny Product: " . mysqli_error($conn));
    } else {
         
              echo "Product has been dennied.";
          
    }

    

