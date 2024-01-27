<?php
include "../connect.php";
$itemsid=filterRequest("itemsid");
getAllData("ratingview","items_id=$itemsid");