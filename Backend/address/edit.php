<?php
include '../connect.php';
$addressid = filterRequest("addressid");
$country = filterRequest("country");
$name = filterRequest("name");
$city = filterRequest("city");
$street = filterRequest("street");

$data = array(
    "address_country" => $country,
    "address_name" => $name,
    "address_city" => $city,
    "address_street" => $street,
  

);
updateData("address", $data, "addressid= $addressid");
