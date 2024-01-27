<?php


  session_start();
  if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    include_once "../config/dbconnect.php";

    $Email = $_POST['Email'];
    $password = $_POST['password'];
    $stmt = $conn->prepare('SELECT * FROM admin WHERE Email = ?');
    $stmt->bind_param('s', $Email);
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result->num_rows > 0) {
      $row = $result->fetch_assoc();
      if ($password == $row['password']) {
        $_SESSION['Email'] = $Email;
        echo 'success';
      } else {
        echo 'error';
      }
    } else {
      echo 'error';
    }
  }
  

?>
