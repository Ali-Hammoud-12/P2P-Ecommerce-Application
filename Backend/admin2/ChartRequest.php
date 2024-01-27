<?php
 include_once "./config/dbconnect.php";
$query = "Select sum(((orderdetails_price- (orderdetails_price*(orderdetails_itemsdiscount/100)) )* orderdetails_qty)
 +orderdetails_shipping ) as total,categories.categories_name, orders.orders_datetime
  from orderdetails INNER join orders on orders.orders_id = orderdetails.orderdetails_oid 
  INNER JOIN items on items.items_id = orderdetails.orderdetails_itemsid 
  INNER JOIN users on items.items_usersid = users.users_id 
  INNER JOIN categories on items.items_cid = categories_id 
  group by  items.items_cid";
 $result = mysqli_query($conn,$query);
 $data = array();
 while($row = mysqli_fetch_array($result)){
      
     echo  $row[1].",".$row[0];
     echo "<br>";
  // $data[] =   $row; 
  }
  //echo json_encode($data);
//  $arraydata = "";
//  $total =0;
//  $arraycat= array();
//  while($row = mysqli_fetch_array($result)){
//   $arraydata = $arraydata."," .$row[1]  ;
//   if(!in_array($row[1],$arraycat)){
//       array_push($arraycat, $row[1] );
//       ${"totalcat".$row[1]} = 0;
//   }
//   $total += $row[0];
//   ${"totalcat".$row[1]} +=  $row[0];
//  }
   
//   echo  $arraydata;
//   echo "<br>";
//   echo $total;
//   echo "<br>";
//   for($i=0; $i< count($arraycat); $i++){
//      ${"totalcat".$arraycat[$i]} = (${"totalcat".$arraycat[$i]}/$total) * 100;
//      echo number_format(${"totalcat".$arraycat[$i]},2);
//      echo "<br>";
//   }
//   /
?>