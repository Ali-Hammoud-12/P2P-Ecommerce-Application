<?php

require_once "../config/dbconnect.php";

// Get the termsAndServices from the form
$terms_and_services = $_POST['terms'];

// Delete the previous value of TAS
$sql = "DELETE FROM `termsAndServices` WHERE id=1";
$result = mysqli_query($conn, $sql);

if (!$result) {
    // If the delete query failed, show an error message and stop executing
    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
    exit();
}

// Insert the new value of TAS
$sql = "INSERT INTO `termsAndServices` (`id`, `TAS`) VALUES (1, '$terms_and_services')";
$result = mysqli_query($conn, $sql);

if ($result) {
    // If the query was successful, show a success message
    echo "termsAndServices saved successfully!";
} else {
    // If the query failed, show an error message
    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
}

?>

