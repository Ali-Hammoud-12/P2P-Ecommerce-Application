<?php 

include "../connect.php" ; 


$usersid = filterRequest("usersid") ; 
$itemsid = filterRequest("itemsid") ; 
$rating = filterRequest("rating") ; 
$comment = filterRequest("comment") ; 


$data = array(
    "rating_usersid"  =>   $usersid , 
    "rating_itemsid"  =>   $itemsid,
    "rating_rate"  =>   $rating, 
    "rating_note"  =>   $comment,
);


insertData("rating" ,$data) ; 