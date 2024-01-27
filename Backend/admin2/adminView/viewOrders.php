<div id="orders-list">
  <h2>Products</h2>
  <table class="table">
    <thead>
      <tr>
        <th class="text-center">S.N.</th>
        <th class="text-center">Name</th>
        <th class="text-center">Quantity</th>
        <th class="text-center">Price</th>
        <th class="text-center">Description</th>
        <th class="text-center">Date Listed</th>
        <th class="text-center" colspan="2">Action</th>
      </tr>
    </thead>
    <tbody>
      <?php
        include_once "../config/dbconnect.php";
        $sql = "SELECT * FROM pending_items";
        $result = $conn->query($sql);
        $count = 1;

        if ($result->num_rows > 0) {
          while ($row = $result->fetch_assoc()) {
            echo '<tr>';
            echo '<td>'.$count.'</td>';
            echo '<td>'.$row["items_name"].'</td>';
            echo '<td>'.$row["items_quantity"].'</td>';
            echo '<td>'.$row["items_price"].'</td>';
            echo '<td>'.$row["items_description"].'</td>';
            echo '<td>'.$row["items_date"].'</td>';
            echo '<td>';
            echo '<button class="btn btn-success accept-btn" style="height:40px" data-id="'.$row['items_id'].'">Accept</button>';
            echo '</td>';
            echo '<td>';
            echo '<button class="btn btn-danger reject-btn" style="height:40px" data-id="'.$row['items_id'].'">Reject</button>';
            echo '</td>';
            echo '</tr>';
            $count++;
          }
        } else {
          echo '<tr><td colspan="7">No products found</td></tr>';
        }
      ?>
    </tbody>
  </table>
</div>

<script>
  $(document).ready(function(){
        $(".accept-btn").click(function(){
        var item_id = $(this).data('id');
        console.log(item_id);
        $.ajax({
            url:"http://localhost/admin_Panel/controller/acceptProductController.php",
            type:"POST",
            data:{item_id:item_id},
            success:function(response){
            console.log(response);
            if(response == "Product has been accepted."){

                $('#item_row_' + item_id).remove();
                showOrders()
                alert("Product has been accepted.");
            }
            else if(response == 'error deleting products.'){
                alert("The product has been accepted ,but there is an error while removing the product");
            }
            else{
                alert("Error accepting product");
            }
        },
        });
        });

        $(".reject-btn").click(function(){
        var item_id = $(this).data('id');
        console.log(item_id);
        $.ajax({
            url:"https://vomas13.000webhostapp.com/senior_proj/admin/controller/rejectProductController.php",
            type:"POST",
            data:{item_id:item_id},
            success:function(response){
            console.log(response);
            if(response == "Product has been rejected."){

                $('#item_row_' + item_id).remove();
                showOrders()
                alert("Product has been rejected.");
            }
            else{
                alert("Error rejecting product");
            }
        },
        });
        });
    });
</script>
