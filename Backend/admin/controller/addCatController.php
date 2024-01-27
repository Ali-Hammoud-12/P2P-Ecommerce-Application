<?php
    include_once "../config/dbconnect.php";
    
    if(isset($_POST['upload']))
    {
       
        $catname = $_POST['categories_name'];
       
         $insert = mysqli_query($conn,"INSERT INTO categories
         (categories_name) 
         VALUES ('$catname')");
 
         if(!$insert)
         {
             echo mysqli_error($conn);
         }
     
    }
        
?>