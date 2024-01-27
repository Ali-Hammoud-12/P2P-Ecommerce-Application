<?php

include_once "connect.php";
$table = 'users';

$usersid = filterRequest("usersid");
$res = imageUpload("upload/profile","files");
$imageold = filterRequest("imageold");

if($res == "empty"){
    $data =array(

        "users_image" => $res,
      
    );

}else{
    deleteFile("upload/profile",$imageold); 
    $data =array(

    
        "users_image" => $res,
 
    

    );
}

updateData($table,$data,"users_id = $usersid");

?>