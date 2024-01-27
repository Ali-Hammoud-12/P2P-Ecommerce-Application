 <?php

 include "../../connect.php";
  $u_id = $_GET["u_id"];
$usersid=$_GET['usersid'];
$data = array(
    "items_active" => 1
);

updateData("items",$data,"items_id = $u_id AND items_active = 0");

insertNotify("success","The order has been Approved",$usersid,"users$usersid","none","refreshorderpending");
// require_once "../config/dbconnect.php";
// $u_id = $_GET["u_id"];
// $query="UPDATE items  set items_active = 1 WHERE items_id=$u_id";
// $result=mysqli_query($conn,$query);
// if(!$result){
//     echo "an error occure while " .mysqli_error($conn);
// }
// else{
//     echo "success";
// }
?>

