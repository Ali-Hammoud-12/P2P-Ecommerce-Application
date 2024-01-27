<!doctype html>
<html lang="en">
 
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Login</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/libs/css/style.css">
    <link rel="stylesheet" href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
    <style>
    html,
    body {
        height: 100%;
    }

    body {
        display: -ms-flexbox;
        display: flex;
        -ms-flex-align: center;
        align-items: center;
        padding-top: 40px;
        padding-bottom: 40px;
    }
    </style>
</head>

<body>
    <!-- ============================================================== -->
    <!-- login page  -->
    <!-- ============================================================== -->
    <div class="splash-container">
        <div class="card ">
            <div class="card-header text-center"><img class="logo-img" style="width:120px; height:65px" src="assets/images/A&H.png" alt="logo"></a><span class="splash-description">Please enter your user information.</span></div>
            <div class="card-body">
               <form id="login-form">
                    <div class="form-group">
                        <input class="form-control form-control-lg" id="Email" type="text" placeholder="Email" autocomplete="off">
                    </div>
                    <div class="form-group">
                        <input class="form-control form-control-lg" id="password" type="password" placeholder="Password">
                    </div>
                   
                    <button type="submit" class="btn btn-primary btn-lg btn-block">Sign in</button>
                </form>
            </div>
            <div class="card-footer bg-white p-0  ">
           <div id="error"></div>
           </div>
        </div>
    </div>
  
    <!-- ============================================================== -->
    <!-- end login page  -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->
    <script src="assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    
<script>

    $(document).ready(function() {
    $('#login-form').submit(function(e) {
        e.preventDefault();
        var Email = $('#Email').val();
        var password = $('#password').val();
        $.ajax({
        type: 'POST',
        url: 'https://vomas13.000webhostapp.com/senior_proj/admin2/controller/loginController.php',
        data: { Email: Email, password: password },
        success: function(response) {
            if (response == 'success') {
            window.location.href = 'index.php';
            } else {
            $('#error').text('Invalid Email or password');
            }
        },
        error: function() {
            $('#error').text('An error occurred while processing your request');
        }
        });
    });
    });

</script>
</body>
 
</html>
