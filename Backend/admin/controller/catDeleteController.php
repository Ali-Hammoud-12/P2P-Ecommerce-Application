<?php

    include_once "../config/dbconnect.php";
    
    $c_id=$_POST['record'];
    $query="DELETE FROM categories where categories_id='$c_id'";

    $data=mysqli_query($conn,$query);

    if(!$data){
        echo "Not able to delete<br>";
        echo "Error: " . mysqli_error($conn) . "<br>";
        echo "Query: " . $query . "<br>";
    }
    
?>