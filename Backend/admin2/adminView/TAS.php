<?php
session_start();
$status = $_GET['status'];
include_once "../config/dbconnect.php";

?>

<!doctype html>
<!doctype html>
<html lang="en">
 
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>A&H</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="../assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="../assets/libs/css/style.css">
    <link rel="stylesheet" href="../assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
</head>

<body>
    <!-- ============================================================== -->
    <!-- main wrapper -->
    <!-- ============================================================== -->
    <div class="dashboard-main-wrapper">
       <!-- ============================================================== -->
        <!-- navbar -->
      <div class="dashboard-header">
            <nav class="navbar navbar-expand-lg bg-white fixed-top">
                <a class="navbar-brand" href="index.php">A&H</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse " id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto navbar-right-top">


                        <li class="nav-item dropdown nav-user">
                            <a class="nav-link nav-user-img" href="#" id="navbarDropdownMenuLink2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-user fa-fw fa-sm text-primary"></i>></a>
                            <div class="dropdown-menu dropdown-menu-right nav-user-dropdown" aria-labelledby="navbarDropdownMenuLink2">
                                <div class="nav-user-info">
                                    <h5 class="mb-0 text-white nav-user-name"><?php echo  $_SESSION['Email'] ?></h5>

                                </div>
                                <a class="dropdown-item" href="login.php"><i class="fas fa-power-off mr-2"></i>Logout</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
        <!-- ============================================================== -->
        <!-- end navbar -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- left sidebar -->
        <!-- ============================================================== -->
        <div class="nav-left-sidebar sidebar-dark">
            <div class="menu-list">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <a class="d-xl-none d-lg-none" href="#">Dashboard</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav flex-column">
   <li class="nav-item">
                                <a class="nav-link" href="../index.php" ><i class="fas fa-chart-line"></i>Dashboard</a>

                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="Users.php?status=0" ><i class="fas fa-users"></i>Users</a>

                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="Users.php?status=1" ><i class="fas fa-users"></i>Banned Users</a>


                            </li>
                            <li class="nav-item ">
                                <a class="nav-link" href="Product.php?status=1" ><i class="fab fa-fw fa-wpforms"></i>Products</a>



                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="Product.php?status=0"><i class="fas fa-fw fa-table"></i>Orders</a>

                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="Categories.php" ><i class="fas fa-fw fa-file"></i> Categories </a>

                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="TAS.php" ><i class="fas fa-fw fa-file"></i> Terms And Services </a>

                            </li>


                        </ul>
                    </div>
                </nav>
            </div>
        </div>
        <!-- end left sidebar -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- wrapper  -->
        <!-- ============================================================== -->
        <div class="dashboard-wrapper">
            <div class="container-fluid dashboard-content">
                <!-- ============================================================== -->
                <!-- pageheader -->
                <!-- ============================================================== -->
               
                <!-- ============================================================== -->
                <!-- end pageheader -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- accrodions -->
                <!-- ============================================================== -->
             
                    <div class="row">
                        <!-- ============================================================== -->
                        <!-- accrodions style one -->
                        <!-- ============================================================== -->
                        <div class="col-xl-1 col-sm-1 col-1">
                        </div>
                        <div class="col-xl-10 col-lg-10 col-md-12 col-sm-12 col-12">
                           
                            <div class="accrodion-regular">
                                <div id="accordion">
                                    <div class="card">
                                        <div class="card-header" id="headingOne">
                                            <h5 class="mb-0">
                                              Terms And Services
                                              </h5>
                                        </div> <?php
                                                    require_once "../config/dbconnect.php";
                                                
                                                    // Retrieve the terms and services content from the database
                                                    $sql = "SELECT `TAS` FROM `termsAndServices`";
                                                    $result = mysqli_query($conn, $sql);
                                                
                                                    // Check if the query was successful
                                                    if ($result && mysqli_num_rows($result) > 0) {
                                                        // Retrieve the content and echo it inside the textarea element
                                                        $row = mysqli_fetch_assoc($result);
                                                        $m= $row['TAS'];
                                                    } else {
                                                        // If the query failed or there was no content, show a default message
                                                        $m= "No terms and services found.";
                                                    }
                                                ?>
                                        <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
                                            <div class="card-body">
                                                <textarea id="terms" rows="20" cols="100" readonly><?php echo $m;?></textarea>
                                                 <button id="edit-btn" class="btn btn-secondary" style="margin-left:50%;margin-top:20px" onclick="toggleEdit()">Edit</button>
                                            </div>
                                        </div>
                                    </div>
                                   
                                    
                                  
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ============================================================== -->
                        <!-- end accrodions style one -->
                        <!-- ============================================================== -->
                        <!-- ============================================================== -->
                        <!-- accrodions style two -->
                        <!-- ============================================================== -->
                     
                        <!-- ============================================================== -->
                        <!-- end accrodions style two -->
                        <!-- ============================================================== -->
                        <!-- ============================================================== -->
                        <!-- accrodions style three -->
                        <!-- ============================================================== -->
                     
                        <!-- ============================================================== -->
                        <!-- end accrodions style two -->
                        <!-- ============================================================== -->
                        <!-- ============================================================== -->
                        <!-- accrodions style four -->
                        <!-- ============================================================== -->
                      
            </div>
            <!-- ============================================================== -->
            <!-- end footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- end wrapper -->
        <!-- ============================================================== -->
    </div>
    <script>
        function toggleEdit() {
            var textarea = document.getElementById('terms');
            var editBtn = document.getElementById('edit-btn');
            if (textarea.readOnly) {
                textarea.readOnly = false;
                textarea.style.border = '1px solid #1abc9c';
                editBtn.innerHTML = 'Save';
            } else {
                textarea.readOnly = true;
                textarea.style.border = '1px solid #ccc';
                editBtn.innerHTML = 'Edit';
                // Save the edited content to the server using AJAX
                var xhr = new XMLHttpRequest();
                xhr.open('POST', "https://vomas13.000webhostapp.com/senior_proj/admin/controller/updateTermsAndServices.php", true);
                xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                xhr.onreadystatechange = function() {
                    if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
                        alert(this.responseText);
                    }
                };
                xhr.send('terms=' + encodeURIComponent(textarea.value));
            }
        }
    </script>
    <!-- ============================================================== -->
    <!-- end main wrapper -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->
    <script src="../assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <script src="../assets/vendor/slimscroll/jquery.slimscroll.js"></script>
    <script src="../assets/libs/js/main-js.js"></script>
  
    <script>
    $('.collapse').on('shown.bs.collapse', function() {
        $(this).parent().find(".fa-angle-down").removeClass("fa-angle-down").addClass("fa-angle-up");
    }).on('hidden.bs.collapse', function() {
        $(this).parent().find(".fa-angle-up").removeClass("fa-angle-up").addClass("fa-angle-down");
    });

    $('.panel-heading a').click(function() {
        $('.panel-heading').removeClass('active');

        //If the panel was open and would be closed by this click, do not active it
        if (!$(this).closest('.panel').find('.panel-collapse').hasClass('in'))
            $(this).parents('.panel-heading').addClass('active');
    });
    </script>
</body>
 
</html>