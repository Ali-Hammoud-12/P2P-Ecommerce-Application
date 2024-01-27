<?php session_start(); ?>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/libs/css/style.css">
    <link rel="stylesheet" href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
    <link rel="stylesheet" href="assets/vendor/charts/chartist-bundle/chartist.css">
    <link rel="stylesheet" href="assets/vendor/charts/morris-bundle/morris.css">
    <link rel="stylesheet" href="assets/vendor/fonts/material-design-iconic-font/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="assets/vendor/charts/c3charts/c3.css">
    <link rel="stylesheet" href="assets/vendor/fonts/flag-icon-css/flag-icon.min.css">
    <title>A&H</title>
</head>

<body>
    <!-- ============================================================== -->
    <!-- main wrapper -->
    <?php

    include_once "./config/dbconnect.php";
    $queryOrders = "Select count(*),sum(((orderdetails_price- (orderdetails_price*(orderdetails_itemsdiscount/100)) )* orderdetails_qty)+orderdetails_shipping ) as totat, 
                      users.users_name
                    from orderdetails
                    INNER JOIN items on items.items_id = orderdetails.orderdetails_itemsid
                    INNER JOIN users on users.users_id = items.items_usersid
                    group by items.items_usersid";
    $resultOrders = mysqli_query($conn, $queryOrders);


    ?>
    <!-- ============================================================== -->
    <div class="dashboard-main-wrapper">
        <!-- ============================================================== -->
        <!-- navbar -->
        <!-- ============================================================== -->
        <div class="dashboard-header">
            <nav class="navbar navbar-expand-lg bg-white fixed-top">
                <a class="navbar-brand" href="index.php">A&H</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse " id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto navbar-right-top">


                        <li class="nav-item dropdown nav-user">
                            <a class="nav-link nav-user-img" href="#" id="navbarDropdownMenuLink2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-user fa-fw fa-sm text-primary"></i></a>
                            <div class="dropdown-menu dropdown-menu-right nav-user-dropdown" aria-labelledby="navbarDropdownMenuLink2">
                                <div class="nav-user-info">
                                    <h5 class="mb-0 text-white nav-user-name"><?php echo  $_SESSION['Email'] ?></h5>

                                </div>
                                <a class="dropdown-item" href="logout.php"><i class="fas fa-power-off mr-2"></i>Logout</a>
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
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-2" aria-controls="submenu-2"><i class="fas fa-chart-line"></i>Dashboard</a>

                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="adminView/Users.php?status=0" ><i class="fas fa-users"></i>Users</a>

                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="adminView/Users.php?status=1" ><i class="fas fa-users"></i>Banned Users</a>


                            </li>
                            <li class="nav-item ">
                                <a class="nav-link" href="adminView/Product.php?status=1" ><i class="fab fa-fw fa-wpforms"></i>Products</a>



                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="adminView/Product.php?status=0"><i class="fas fa-fw fa-table"></i>Orders</a>

                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="adminView/Categories.php" ><i class="fas fa-fw fa-file"></i> Categories </a>

                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="adminView/TAS.php" ><i class="fas fa-fw fa-file"></i> Terms And Services </a>

                            </li>




                        </ul>
                    </div>
                </nav>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- end left sidebar -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- wrapper  -->
        <!-- ============================================================== -->
        <div class="dashboard-wrapper">
            <div class="dashboard-ecommerce">
                <div class="container-fluid dashboard-content ">
                    <!-- ============================================================== -->
                    <!-- pageheader  -->
                    <!-- ============================================================== -->
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="page-header">
                                <h2 class="pageheader-title">A&H Dashboard </h2>

                                <div class="page-breadcrumb">
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">

                                        </ol>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- end pageheader  -->
                    <!-- ============================================================== -->
                    <div class="ecommerce-widget">

                        <div class="row">
                            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                                <div class="card">
                                    <div class="card-body">

                                        <span class="fa-xs text-secondary mr-1 legend-tile">

                                            <h5 class="text-muted">Total Revenue</h5>
                                        </span>


                                        <div class="metric-value d-inline-block">
                                            <h1 class="mb-1">
                                                <?php
                                                $sql = "SELECT SUM(orders_total) AS total_profit FROM orders";
                                                $result = $conn->query($sql);
                                                $row = $result->fetch_assoc();
                                                echo "$" . number_format($row['total_profit'], 2);
                                                ?>
                                            </h1>
                                        </div>
                            <div class="float-right icon-circle-medium  icon-box-lg  bg-primary-light mt-1">
                                        <i class="fas fa-chart-line fa-fw fa-sm text-primary"></i>
                                    </div>
                                    </div>

                                </div>
                            </div>
                            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="text-muted">Total Users</h5>
                                        <div class="metric-value d-inline-block">
                                            <h1 class="mb-1">
                                                <?php
                                                $sql = "SELECT * from users where users_type=2 OR users_type=3";
                                                $result = $conn->query($sql);
                                                $count = 0;
                                                if ($result->num_rows > 0) {
                                                    while ($row = $result->fetch_assoc()) {

                                                        $count = $count + 1;
                                                    }
                                                }
                                                echo $count;
                                                ?>
                                            </h1>
                                        </div><div> </div>
                                        <div class="float-right icon-circle-medium  icon-box-lg  bg-primary-light mt-1">
                                        <i class="fa fa-user fa-fw fa-sm text-primary"></i>
                                    </div>
                                    </div>

                                </div>
                            </div>
                            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="text-muted">Total Products</h5>
                                        <div class="metric-value d-inline-block">
                                            <h1 class="mb-1">
                                                <?php

                                                $sql = "SELECT * from items";
                                                $result = $conn->query($sql);
                                                $count = 0;
                                                if ($result->num_rows > 0) {
                                                    while ($row = $result->fetch_assoc()) {

                                                        $count = $count + 1;
                                                    }
                                                }
                                                echo $count;
                                                ?>
                                            </h1>
                                        </div><div> </div>
                                      <div class="float-right icon-circle-medium  icon-box-lg  bg-primary-light mt-1">
                                        <i class="fas fa-shopping-cart fa-fw fa-sm text-primary"></i>
                                    </div> 
                                    </div>

                                </div>
                            </div>
                            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="text-muted">Total Categories</h5>
                                        <div class="metric-value d-inline-block">
                                            <h1 class="mb-1">
                                                <?php

                                                $sql = "SELECT * from categories";
                                                $result = $conn->query($sql);
                                                $count = 0;
                                                if ($result->num_rows > 0) {
                                                    while ($row = $result->fetch_assoc()) {

                                                        $count = $count + 1;
                                                    }
                                                }
                                                echo $count;
                                                ?>
                                            </h1>
                                        </div>
                                       <div> </div>
                                      <div class="float-right icon-circle-medium  icon-box-lg  bg-primary-light mt-1">
                                        <i class="fas fa-th-large fa-fw fa-sm text-primary"></i>
                                    </div> 
                                    </div>

                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <!-- ============================================================== -->
                            <!-- total revenue  -->
                            <!-- ============================================================== -->


                            <!-- ============================================================== -->
                            <!-- ============================================================== -->
                            <!-- category revenue  -->
                            <!-- ============================================================== -->
                            <div class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12">
                                <div class="card">
                                    <h5 class="card-header">Revenue by Category</h5>
                                    <div class="card-body">
                                        <div id="c3chart_category" style="height: 420px;"></div>
                                        <div id="morris_totalrevenue" style='display:none'></div>
                                    </div>
                                </div>
                            </div>
                            <!-- ============================================================== -->
                            <!-- end category revenue  -->
                            <!-- ============================================================== -->

                            <div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
                                <div class="card">
                                    <h5 class="card-header"> Sales By Shop Owners  <span style='float:right'> Orders Count </span></h5>
                                    <div class="card-body p-0">
                                        <ul class="social-sales list-group list-group-flush">
                                            <?php
                                            while ($row = mysqli_fetch_array($resultOrders)) {
                                            ?>
                                                <li class="list-group-item social-sales-content">
                                            <span class="social-sales-icon-circle facebook-bgcolor mr-2"><i class="fas fa-user"></i></span>
                                            <span class="social-sales-name"><?php echo $row[2]; ?></span>
                                               <span class="social-sales-count text-dark"><?php echo $row[0]; ?></span>
                                                </li>
                                            <?php
                                            }
                                            ?>
                                        </ul>
                                    </div>
                                   
                                </div>
                            </div>
                        </div>
                        <div class="row">

                            <div class="col-xl-4 col-lg-6 col-md-6 col-sm-12 col-12">
                                <!-- ============================================================== -->
                                <!-- sales traffice source  -->
                                <!-- ============================================================== -->
                                <div class="card">
                                    <h5 class="card-header"> Sales By Shop Owner <span style='float:right'> Total Profit </span> </h5>
                                    <div class="card-body p-0">
                                        <ul class="traffic-sales list-group list-group-flush">
                                        <?php
                                         $resultOrders = mysqli_query($conn, $queryOrders);
                                            while ($row = mysqli_fetch_array($resultOrders)) {
                                            ?>
                                                <li class="list-group-item social-sales-content">
                                            <span class="social-sales-icon-circle facebook-bgcolor mr-2"><i class="fas fa-user"></i></span>
                                            <span class="social-sales-name"><?php echo $row[2]; ?></span>
                                               <span class="social-sales-count text-dark"><?php echo $row[1]; ?>$</span>
                                                </li>
                                            <?php
                                            }
                                            ?>
                                        </ul>
                                    </div>
                                   
                                </div>
                            </div>
                            <!-- ============================================================== -->
                            <!-- end sales traffice source  -->
                            <!-- ============================================================== -->
                            <!-- ============================================================== -->
                            <!-- sales traffic country source  -->
                            <!-- ============================================================== -->
                            <div class="col-xl-3 col-lg-12 col-md-6 col-sm-12 col-12">

                            </div>
                        </div>
                        <!-- ============================================================== -->
                        <!-- end sales traffice country source  -->
                        <!-- ============================================================== -->
                    </div>
                </div>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- footer -->
        <!-- ============================================================== -->
        <div class="footer">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                        Copyright © 2018 Concept. All rights reserved. Dashboard by <a href="https://colorlib.com/wp/">Colorlib</a>.
                    </div>
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                        <div class="text-md-right footer-links d-none d-sm-block">
                            <a href="javascript: void(0);">About</a>
                            <a href="javascript: void(0);">Support</a>
                            <a href="javascript: void(0);">Contact Us</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- end footer -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- end wrapper  -->
    <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- end main wrapper  -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->
    <!-- jquery 3.3.1 -->
    <script src="assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <!-- bootstap bundle js -->
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <!-- slimscroll js -->
    <script src="assets/vendor/slimscroll/jquery.slimscroll.js"></script>
    <!-- main js -->
    <script src="assets/libs/js/main-js.js"></script>
    <!-- chart chartist js -->
    <script src="assets/vendor/charts/chartist-bundle/chartist.min.js"></script>
    <!-- sparkline js -->
    <script src="assets/vendor/charts/sparkline/jquery.sparkline.js"></script>
    <!-- morris js -->
    <script src="assets/vendor/charts/morris-bundle/raphael.min.js"></script>
    <script src="assets/vendor/charts/morris-bundle/morris.js"></script>
    <!-- chart c3 js -->
    <script src="assets/vendor/charts/c3charts/c3.min.js"></script>
    <script src="assets/vendor/charts/c3charts/d3-5.4.0.min.js"></script>
    <script src="assets/vendor/charts/c3charts/C3chartjs.js"></script>
    <script src="assets/libs/js/dashboard-ecommerce.js"></script>
</body>

</html>