<div id="product-list">
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
      </tr>
    </thead>
    <tbody>
      <?php
        include_once "../config/dbconnect.php";
        $sql = "SELECT * FROM items";
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
            echo '<td>'.$row["items_datetime"].'</td>';
            echo '</tr>';
            $count++;
          }
        } else {
          echo '<tr><td colspan="5">No products found</td></tr>';
        }
      ?>
    </tbody>
  </table>
</div>
