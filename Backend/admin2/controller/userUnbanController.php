<?php

require_once "../config/dbconnect.php";

if(isset($_POST['u_id'])) {
    $u_id = $_POST['u_id'];
    $Unbanned_user = "SELECT * FROM banned_users where users_id='$u_id'";
    $row = mysqli_fetch_assoc(mysqli_query($conn, $Unbanned_user));
    $sql = "INSERT INTO users (users_id,users_type, users_name,users_phone,users_email,users_verfiycode,users_approve,users_password) VALUES ('".$row['users_id']."', '".$row['users_type']."', '".$row['users_name']."', '".$row['users_phone']."', '".$row['users_email']."','".$row['users_verfiycode']."', '".$row['users_approve']."', '".$row['users_password']."')";
    $result2 = mysqli_query($conn, $sql);
    if(!$result2){
        die("Error banning user: " . mysqli_error($conn));
    } else {
        $query = "DELETE FROM banned_users where users_id='$u_id'";
        $result = mysqli_query($conn, $query);
        if(!$result){
            echo "User has been banned.";
            die("Error deleting record: " . mysqli_error($conn));
        } else {
            echo "User has been unbanned.";
        }
    }
}