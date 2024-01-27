<?php

include "../../connect.php";

$id = filterRequest("id"); 
$imagename = filterRequest("imagename");
deleteFile("../../uploads/categories", $imagename);

deleteData("categories","categories_id = $id");

?>