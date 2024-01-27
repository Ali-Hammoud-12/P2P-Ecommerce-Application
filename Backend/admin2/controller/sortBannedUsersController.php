<?php

require_once "../config/dbconnect.php";

$user_type = $_POST['user_type'];
if ($user_type == 'customer') {
    $sql = "SELECT * FROM banned_users WHERE users_type = 3";
  } elseif ($user_type == 'shop_owner') {
    $sql = "SELECT * FROM banned_users WHERE users_type = 2";
  } elseif ($user_type == 'all') {
    $sql = "SELECT * FROM banned_users WHERE users_type != 1";
  } else {
    echo "Invalid user type";
    exit;
  }
  



?>