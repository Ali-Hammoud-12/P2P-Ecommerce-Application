<?php
include '../connect.php';
$usersid = filterRequest("usersid");
$name=filterRequest("name");
$city = filterRequest("city");
$street = filterRequest("street");
$country = filterRequest("country");

$data = array(
    "address_usersid" => $usersid,
    "address_name" => $name,
    "address_city" => $city,
     "address_street" => $street,
          "address_country" =>$country ,
   

);
insertData("address", $data);
