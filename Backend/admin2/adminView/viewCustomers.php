<div >
  <h2>All Users</h2>
  <table class="table ">
    <thead>
      <tr>
        <th class="text-center">S.N.</th>
        <th class="text-center">Username </th>
        <th class="text-center">Email</th>
        <th class="text-center">Contact Number</th>
        <th class="text-center" colspan="2">Action</th>
        <!-- <th class="text-center">Joining Date</th> -->
      </tr>
    </thead>
    <?php
      include_once "../config/dbconnect.php";
      $sql="SELECT * from users where users_type=2 OR users_type=3";
      $result=$conn-> query($sql);
      $count=1;
      if ($result-> num_rows > 0){
        while ($row=$result-> fetch_assoc()) {
           
    ?>
    <tr>
      <td><?=$count?></td>
      <td><?=$row["users_name"]?> 
      <td><?=$row["users_email"]?></td>
      <td><?=$row["users_phone"]?></td>
      <td>
        <button class="btn btn-danger ban-btn" style="height:40px" data-id="<?=$row['users_id']?>">Ban</button>
      </td>
      <!-- <td><?=$row["registered_at"]?></td> -->
    </tr>
    <?php
            $count=$count+1;
           
        } 
    } else {
      echo '<tr><td colspan="6">No users found</td></tr>';
    }
    ?>
  </table>
</div>

<script>
  $(document).ready(function(){
    $(".btn-danger").click(function(){
      var u_id = $(this).data('id');
      console.log(u_id);
      $.ajax({
        url:"https://vomas13.000webhostapp.com/senior_proj/admin/controller/userDeleteController.php",
        type:"POST",
        data:{u_id:u_id},
        success:function(response){
        console.log(response);
        if(response == "User has been banned."){
            // Remove the deleted user row from the table
            $('#user_row_' + u_id).remove();
            showCustomers();
            alert("User has been banned.");
        }
        else if(response == 'User has been banned.'){
            alert("User has been banned successfully, but an error occurred while deleting the user.");
        }
        else{
            alert("An error occurred while banning or deleting the user.");
          }
       },
      });
    });
  });
</script>
