<?php
//error_reporting(E_ALL ^ E_WARNING); 
    include_once "../config/dbconnect.php";
    
    if(isset($_POST['add'])){
     $catname = $_POST['catname'];
      //echo "OKK33";
        // Set image placement folder
        $target_dir = "../../upload/categories/";
        // Get file path
        $target_file = $target_dir . basename($_FILES["catimage"]["name"]);  
        $target_filename=basename($_FILES["catimage"]["name"]);
        if (!file_exists($_FILES["catimage"]["tmp_name"])) {
            // Validation goes here
        } else {
            if (move_uploaded_file($_FILES["catimage"]["tmp_name"], $target_file)) {
                $sql = "INSERT INTO categories (categories_name, categories_image ) VALUES ('$catname','$target_filename')";
                $stmt = $conn->prepare($sql);
                 if($stmt->execute()){
                    // echo "OKK";
                   header("location:../adminView/Categories.php?message=Category Added Successufully");  
                  // echo "success";
                 }
            } else {
                 // echo "failed";
              header("location:../adminView/Categories.php?message=Error While Adding Category");            
            }
        
    }
   }
        
?>