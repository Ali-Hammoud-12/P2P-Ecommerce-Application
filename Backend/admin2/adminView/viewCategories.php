<div>
  <h3>Category Items</h3>
  <table class="table">
    <thead>
      <tr>
        <th class="text-center">S.N.</th>
        <th class="text-center">Category Name</th>
      </tr>
    </thead>
    <?php
    include_once "../config/dbconnect.php";
    $sql = "SELECT * FROM categories";
    $result = $conn->query($sql);
    $count = 1;
    if ($result->num_rows > 0) {
      while ($row = $result->fetch_assoc()) {
        ?>
        <tr id="category_row_<?=$row['categories_id']?>">
          <td><?=$count?></td>
          <td><?=$row["categories_name"]?></td>
        </tr>
        <?php
        $count = $count + 1;
      }
    }
    ?>
  </table>

  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-brown" style="height:40px" data-toggle="modal" data-target="#myModal">
    Add Category
  </button>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">

      <!-- Modal content -->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">New Category Item</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
          <form enctype='multipart/form-data' action="./controller/addCatController.php" method="POST">
            <div class="form-group">
              <label for="c_name">Category Name:</label>
              <input type="text" class="form-control" name="c_name" required>
            </div>
            <div class="form-group">
              <button type="submit" class="btn btn-brown" name="upload" style="height:40px">Add Category</button>
            </div>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" style="height:40px">Close</button>
        </div>
      </div>

    </div>
  </div>
</div>



<!-- <script>
  $(document).ready(function(){
    $(".btn-danger").click(function(){
      var c_id = $(this).data('id');
      console.log(c_id);
      $.ajax({
        url:"https://vomas13.000webhostapp.com/senior_proj/admin/controller/deletecategories.php",
        type:"POST",
        data:{
          record:c_id
        },
        success:function(response){
          console.log(response);
          if(response == 'success'){
            // Remove the deleted category row from the table
            $('#cat_row_' + c_id).remove();
            alert("Category item deleted successfully.");
          }
          else{
            alert("An error occurred while deleting the category item.");
          }
        },
      });
    });
  });
</script> -->

   