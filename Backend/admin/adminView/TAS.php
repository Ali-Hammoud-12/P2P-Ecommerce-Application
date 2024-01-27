<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Terms and Services</title>
    <style>
        /* Style the header */
        header {
            background-color: #3B3131;
            color: white;
            padding: 10px;
            height: 70px;
            text-align: center;
        }
        /* Style the container */
        .container {
            margin: 50px auto;
            max-width: 800px;
            padding: 0 20px;
        }
        /* Style the textarea */
        textarea {
            width: 100%;
            height: 300px;
            margin-bottom: 20px;
            padding: 10px;
            border: 1px solid #ccc;
            resize: vertical;
        }
        /* Style the button */
        button {
            background-color: #3B3131;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            float: right;
        }
        /* Style the footer */
        footer {
            background-color: #3B3131 ;
            color: white;
            padding: 10px;
            text-align: center;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>
    <header>
        <h1>Terms and Services</h1>
    </header>
    <div class="container">

    <textarea id="terms" readonly><?php
    require_once "../config/dbconnect.php";

    // Retrieve the terms and services content from the database
    $sql = "SELECT `TAS` FROM `termsAndServices`";
    $result = mysqli_query($conn, $sql);

    // Check if the query was successful
    if ($result && mysqli_num_rows($result) > 0) {
        // Retrieve the content and echo it inside the textarea element
        $row = mysqli_fetch_assoc($result);
        echo $row['TAS'];
    } else {
        // If the query failed or there was no content, show a default message
        echo "No terms and services found.";
    }
?></textarea>
        <button id="edit-btn" onclick="toggleEdit()">Edit</button>
    </div>
    <footer>
        <p>&copy; 2023 A&H </p>
    </footer>

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
</body>
</html>
