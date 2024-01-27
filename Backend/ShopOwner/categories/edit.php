<?php

include_once "../../connect.php";
$table = 'categories';
$name = filterRequest("name");
$id = filterRequest("id");

$res = imageUpload("../../upload/categories","files");
$imageold = filterRequest("imageold");

if($res == "empty"){
    $data =array(

        "categories_name" => $name,
    );

}else{
    deleteFile("../../upload/categories",$imageold); 
    $data =array(

        "categories_name" => $name,
        "categories_image" => $res,

    );
}

updateData($table,$data,"categories_id = $id");

?>
