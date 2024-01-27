<div id="bannedusers">
  <h2>Banned Users</h2>
  <label for="user-type-select">Filter by User Type:</label>
  <select id="user-type-select">
    <option value="all">All</option>
    <option value="customer">Customer</option>
    <option value="shop_owner">Shop Owner</option>
  </select>
  <table class="table">
  <thead>
    <tr>
      <th class="text-center">S.N.</th>
      <th class="text-center">Username</th>
      <th class="text-center">Email</th>
      <th class="text-center">Contact Number</th>
      <th class="text-center" colspan="2">Action</th>
    </tr>
  </thead>
  <tbody>
    <?php
      include_once "../config/dbconnect.php";
      $user_type = isset($_GET['user_type']) ? $_GET['user_type'] : 'all';

      if ($user_type == 'customer') {
          $sql = "SELECT * FROM banned_users WHERE users_type = 3";
      } elseif ($user_type == 'shop_owner') {
          $sql = "SELECT * FROM banned_users WHERE users_type = 2";
      } elseif ($user_type == 'all') {
          $sql = "SELECT * FROM banned_users WHERE users_type != 1";
      } else {
        echo("none");
        die();
      }

      $result = $conn->query($sql);
      $count = 1;

      if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
          echo '<tr>';
          echo '<td>'.$count.'</td>';
          echo '<td>'.$row["users_name"].'</td>';
          echo '<td>'.$row["users_email"].'</td>';
          echo '<td>'.$row["users_phone"].'</td>';
          echo '<td>';
          echo '<button class="btn btn-success unban-btn" style="height:40px" data-id="'.$row['users_id'].'">Unban</button>';
          echo '</td>';
          echo '</tr>';
          $count++;
        }
      } else {
        echo '<tr><td colspan="6">No users found</td></tr>';
      }
    ?>
  </tbody>
</table>

</div>

<script>
  $(document).ready(function(){
    $(".btn-success").click(function(){
      var u_id = $(this).data('id');
      console.log(u_id);
      $.ajax({
        url:"https://vomas13.000webhostapp.com/senior_proj/admin/controller/userUnbanController.php",
        type:"POST",
        data:{u_id:u_id},
        success:function(response){
        console.log(response);
        if(response == "User has been unbanned."){
            // Remove the unbanned user row from the table
            $('#user_row_' + u_id).remove();
            showBannedUsers()
            alert("User has been unbanned.");
        }
        else if(response == 'User has been banned.'){
            alert("User has been unbanned successfully, but an error occurred while deleting the user.");
        }
        else{
            alert("An error occurred while unbanning or deleting the user.");
          }
       },
      });
    });

      $('#user-type-select').change(function() {
      var selected_user_type = $(this).val();
      var url = './viewBannedUsers.php?user_type=' + encodeURIComponent(selected_user_type);
      $.ajax({
        url: url,
        type: 'GET',
        success: function(data) {
          $('table').html(data);
        },
        error: function(jqXHR, textStatus, errorThrown) {
          console.log(textStatus, errorThrown);
        }
      });
    });


  });
</script>
