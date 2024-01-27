<?php
session_start();
$status = $_GET['status'];
include_once "../config/dbconnect.php";

?>

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
    <link rel="stylesheet" type="text/css" href="../assets/vendor/datatables/css/dataTables.bootstrap4.css">
    <link rel="stylesheet" type="text/css" href="../assets/vendor/datatables/css/buttons.bootstrap4.css">
    <link rel="stylesheet" type="text/css" href="../assets/vendor/datatables/css/select.bootstrap4.css">
    <link rel="stylesheet" type="text/css" href="../assets/vendor/datatables/css/fixedHeader.bootstrap4.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>
    <!-- ============================================================== -->
    <!-- main wrapper -->
    <!-- ============================================================== -->
    <div class="dashboard-main-wrapper">
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
        <div class="dashboard-wrapper">
            <div class="container-fluid  dashboard-content">
                <!-- ============================================================== -->
                <!-- pageheader -->
                <!-- ============================================================== -->
            
                <!-- ============================================================== -->
                <!-- end pageheader -->
                <!-- ============================================================== -->
                <div class="row">
                    <!-- ============================================================== -->
                    <!-- basic table  -->
                    <!-- ============================================================== -->
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="card">
                            <h5 class="card-header"><?php if($status==0)echo "Pending Product Table";else {echo "Accepted Product Table";}?> </h5>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered first">
                                        <thead>
                                            <tr>
                                                <th>SN</th>
                                                <th>Shop Owner</th>
                                                <th>Name</th>
                                                <th>Quatity</th>
                                                <th>Price </th>
                                                <th>Description</th>
                                                <th>Date Listed</th>
                                                <?php
                                                if ($status==0){
                                                    echo '<th>Action</th>';
                                                }?>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php

                                            $query = "Select items_id, users.users_name,items_name,items_quantity, items_Price,items_description ,items_datetime,items_usersid
                                            from items
                                            INNER JOIN users ON items.items_usersid=users.users_id
                                            where items_active = $status";
                                            $sq = 0;
                                            $result = mysqli_query($conn, $query);
                                            while ($row = mysqli_fetch_array($result)) {
                                                $sq++;
                                            ?>

                                                <tr>
                                                    <td>
                                                        <?php echo $sq; ?>
                                                    </td>
                                                    <td>
                                                        <?php echo $row[1] ?>
                                                    </td>
                                                    <td>
                                                        <?php echo $row[2] ?>
                                                    </td>
                                                    <td>
                                                        <?php echo $row[3] ?>
                                                    </td>
                                                    <td>
                                                        <?php
                                                      
                                                            echo $row[4]; ?>

                                                    </td>
                                                    <td>
                                                        <?php echo $row[5] ?>
                                                    </td>
                                                    <td>
                                                        <?php echo $row[6] ?>
                                                    </td>
                                                  <?php  if ($status == 0) {
                                            
                                                   echo '<td style="width:170px">';
                                                   
                                                   echo'<label><span>';
                                                            
                                                  echo "<button class='btn btn-success unban-btn' style='height:40px' onclick=\"AcceptItems($row[0],$row[7])\"> Accept";
            
                                                        echo '</button> &nbsp;&nbsp;'; 
                                                       
                                                        echo "<button class='btn btn-danger unban-btn' style='height:40px' onclick=\"DenyItems($row[0],$row[7])\"> Deny";
            
                                                        echo '</button>'; 
                                                        echo'</span></label>';
                                                    echo '</td>';
                                                  
                                                  } ?>

                                                </tr>
                                            <?php
                                            }


                                            ?>
                                        </tbody>

                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- end basic table  -->
                    <!-- ============================================================== -->
                </div>


            </div>
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->

            <!-- ============================================================== -->
            <!-- end footer -->
            <!-- ============================================================== -->
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- end main wrapper -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->
    <script>
        function AcceptItems(u_id,usersid){
      
          
             $.ajax({
               url:"https://vomas13.000webhostapp.com/senior_proj/admin2/controller/acceptitems.php?u_id="+u_id+"&usersid="+usersid,
               type:"POST",
               data:{u_id:u_id},
               
               success:function(response){
                 
               console.log(response['status']);
                 var responseObject = JSON.parse(response);
                 var status = responseObject.status;

              
               if(status =="success" ){
                 
                 
                   alert("Product has been Accepted.");
                   location.reload();
               }
              
               else{
                   alert("An error occurred while Accept the Product.");
                 }
               }
             });
        }
        function DenyItems(u_id,option){
           
            
             $.ajax({
               url:"https://vomas13.000webhostapp.com/senior_proj/admin2/controller/denyitems.php?u_id="+u_id+"&usersid="+usersid,
               type:"POST",
               data:{u_id:u_id},
               success:function(response){
               console.log(response);
               if(response == "Product has been dennied."){
                
                  
                   alert("Product has been dennied.");
                   location.reload();
               }
              
               else{
                   alert("An error occurred while Dennying the  the Product.");
                 }
               }
             });
        }
       </script>
    <script src="../assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <script src="../assets/vendor/slimscroll/jquery.slimscroll.js"></script>
    <script src="../assets/vendor/multi-select/js/jquery.multi-select.js"></script>
    <script src="../assets/libs/js/main-js.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script src="../assets/vendor/datatables/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
    <script src="../assets/vendor/datatables/js/buttons.bootstrap4.min.js"></script>
    <script src="../assets/vendor/datatables/js/data-table.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.print.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.colVis.min.js"></script>
    <script src="https://cdn.datatables.net/rowgroup/1.0.4/js/dataTables.rowGroup.min.js"></script>
    <script src="https://cdn.datatables.net/select/1.2.7/js/dataTables.select.min.js"></script>
    <script src="https://cdn.datatables.net/fixedheader/3.1.5/js/dataTables.fixedHeader.min.js"></script>

</body>

</html>