function showCategory(){  
    $.ajax({
        url:"./adminView/viewCategories.php",
        method:"post",
        data:{record:1},
        success:function(data){
            $('.allContent-section').html(data);
        }
    });
}
function showCustomers(){
    $.ajax({
        url:"./adminView/viewCustomers.php",
        method:"post",
        data:{record:1},
        success:function(data){
            $('.allContent-section').html(data);
        }
    });
}

function showBannedUsers(){
    $.ajax({
        url:"./adminView/viewBannedUsers.php",
        method:"post",
        data:{record:1},
        success:function(data){
            $('.allContent-section').html(data);
        }
    });
}

function showProducts(){
    $.ajax({
        url:"./adminView/viewProducts.php",
        method:"post",
        data:{record:1},
        success:function(data){
            $('.allContent-section').html(data);
        }
    });
}

function showOrders(){
    $.ajax({
        url:"./adminView/viewOrders.php",
        method:"post",
        data:{record:1},
        success:function(data){
            $('.allContent-section').html(data);
        }
    });
}

function termsAndServices(){
    $.ajax({
        url:"./adminView/TAS.php",
        method:"post",
        data:{record:1},
        success:function(data){
            $('.allContent-section').html(data);
        }
    });
}

//delete category data
function categoryDelete(id){
    $.ajax({
        url:"./controller/catDeleteController.php",
        method:"post",
        data:{record:id},
        success:function(data){
            alert('Category Successfully deleted');
            $('form').trigger('reset');
            showCategory();
        }
    });
}

function userDelete(id){
    $.ajax({
        url:"./controller/userDeleteController.php",
        method:"post",
        data:{record:id},
        success:function(data){
            alert('User Successfully deleted');
            $('form').trigger('reset');
            showCustomers();
        }
    });
}
function showDashboard() {
       $.ajax({
        url:"./adminView/Dashboard.php",
        method:"post",
        data:{record:1},
        success:function(data){
         $('.allContent-section').html(data);
            showCustomers();
        }
    });

}
