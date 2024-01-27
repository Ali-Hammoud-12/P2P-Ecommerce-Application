<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Login Page</title>
	<link rel="stylesheet" href="./assets/css/loginCSS.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="login">
			<h1>Login</h1>
			<form id="login-form">
				<div class="input-group">
					<label for="Email">Email</label>
					<input type="text" name="Email" id="Email" required>
				</div>
				<div class="input-group">
					<label for="password">Password</label>
					<input type="password" name="password" id="password" required>
				</div>
				<button type="submit" class="btn">Login</button>
			</form>
			<div id="error"></div>
		</div>
	</div>
</body>
</html>

<script>

    $(document).ready(function() {
    $('#login-form').submit(function(e) {
        e.preventDefault();
        var Email = $('#Email').val();
        var password = $('#password').val();
        $.ajax({
        type: 'POST',
        url: 'https://vomas13.000webhostapp.com/senior_proj/admin/controller/loginController.php',
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



