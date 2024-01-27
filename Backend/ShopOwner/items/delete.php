<?php

include "../../connect.php";

$id = filterRequest("id"); 
$imagename = filterRequest("imagename");
deleteFile("../../uploads/items", $imagename);

deleteData("items","items_id = $id");

?>