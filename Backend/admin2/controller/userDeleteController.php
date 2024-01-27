<?php

require_once "../config/dbconnect.php";

    $option = $_GET['option'];
    $u_id = $_GET['u_id'];
    $sql = "UPDATE users set banned_users=$option WHERE users_id=$u_id ";
    $result2 = mysqli_query($conn, $sql);
    if(!$result2){
        die("Error banning user: " . mysqli_error($conn));
    } else {
           if($option == 1)
              echo "User has been banned.";
            else  echo "User has been Unbanned.";
        }
    



