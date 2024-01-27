<?php


include "../connect.php";

$username = filterRequest("username");
$password = sha1($_POST['password']);
$email = filterRequest("email");
$phone = filterRequest("phone");
$verfiycode     = rand(10000 , 99999);

$stmt = $con->prepare("SELECT * FROM users WHERE users_email = ? OR users_phone = ? ");
$stmt->execute(array($email, $phone));
$count = $stmt->rowCount();
if ($count > 0) {
    printFailure("Email Exist");
   // $result = array("hasAccount"=>"True");
} else {

    $data = array(
        "users_name" => $username,
        "users_password" =>  $password,
        "users_email" => $email,
        "users_phone" => $phone,
        "users_verfiycode" => $verfiycode ,
        "users_type"=> 3
    );
    sendEmail($email , "Verification Code" , " Your Verification Code is $verfiycode") ; 
    insertData("users" , $data) ; 
    //$result = array("hasAccount"=>"False");

}

//echo json_encode($result);