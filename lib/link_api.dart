class AppLink {
  static const String server = "https://vomas13.000webhostapp.com/senior_proj";
  static const String test = "$server/test.php";
  static const String images =
      "https://vomas13.000webhostapp.com/senior_proj/upload";

// -------------------------- Auth----------------
  static const String signUp = "$server/auth/customersignup.php";
  static const String shopownersignUp = "$server/auth/shopownersignup.php";
  static const String login = "$server/auth/login.php";
  static const String verifycodesign = "$server/auth/verifycode.php";
  static const String resend = "$server/auth/resend.php";

//------------------------forgetPassword-------------
  static const String checkemail = "$server/forgetpassword/checkemail.php";
  static const String verifycodeforgetpassword =
      "$server/forgetpassword/verifycode.php";
  static const String resetpassword =
      "$server/forgetpassword/resetpassword.php";
      static const String changepassword =
      "$server/forgetpassword/changepassword.php";

//-------------------------------Home------------
  static const String homepage = "$server/home.php";
  //=================Items================
  static const String Items = "$server/items/items.php";
  static const String search = "$server/items/search.php";
  static const String addrating = "$server/rating/add.php";
  static const String viewrating = "$server/rating/view.php";
  static const String itemsshop = "$server/items/shopitems.php";  



  //=================Favorite============
  static const String AddFavorite = "$server/favorite/add.php";
  static const String RemoveFavorite = "$server/favorite/remove.php";
  static const String ViewFavorite = "$server/favorite/view.php";
  static const String deletefromfavroite =
      "$server/favorite/deletefromfavroite.php";

  //================Cart=============

  static const String deletecart = "$server/cart/delete.php";
  static const String addcart = "$server/cart/add.php";
  static const String viewcart = "$server/cart/view.php";
  static const String cartgetcountitems = "$server/cart/getcountitems.php";
  //=============Address============
  static const String addressadd = "$server/address/add.php";
  static const String addressedit = "$server/address/edit.php";
  static const String addressdelete = "$server/address/delete.php";
  static const String addressview = "$server/address/view.php";
  //==============Terms and services
  static const String termsandservices = "$server/termsandservices.php";
  

  //==================Orders
  static const String checkout = "$server/orders/checkout.php";
  static const String pendingorders = "$server/orders/pending.php";
  static const String notification = "$server/notification.php";
  static const String carrier = "$server/orders/carrier.php";
  static const String details = "$server/orders/details.php";
  static const String buyagain = "$server/orders/orderagain.php";

  //=====================Shopowner
  static const String itemsview = "$server/ShopOwner/items/view.php";
  static const String itemslistview = "$server/ShopOwner/items/viewlisted.php";
  static const String itemsadd = "$server/ShopOwner/items/add.php";
  static const String itemsedit = "$server/ShopOwner/items/edit.php";
  static const String itemsdelete = "$server/ShopOwner/items/delete.php";
  static const String itemssortbycategory = "$server/ShopOwner/items/sortcategory.php";
  static const String analytics = "$server/ShopOwner/analytics.php";
  static const String analyticstotal = "$server/ShopOwner/totalprofit.php";

  static const String searchitems = "$server/ShopOwner/items/searchitems.php";
  static const String searchlisteditems = "$server/ShopOwner/items/searchitemslisted.php";

  //------------------------Category---------------------
  static const String categoryview = "$server/ShopOwner/categories/view.php";


  
//------------------------orders---------------------
  static const String approve = "$server/ShopOwner/orders/approve.php";
  static const String viewarchiveOrders = "$server/ShopOwner/orders/archive.php";
  static const String pending = "$server/ShopOwner/orders/pending.php";
  static const String viewaccepted = "$server/ShopOwner/orders/viewaccepted.php";
  static const String viewpending = "$server/ShopOwner/orders/viewpending.php";
  static const String shopownerorderdetails = "$server/ShopOwner/orders/details.php";
  static const String shopownerorderdetails2 = "$server/ShopOwner/orders/details2.php";
//==============Profileupload
  static const String profilepic = "$server/uploadimage.php";
  static const String showusers = "$server/showallusers.php";

 
  
  //------------------------Images-------------------------------------
  static const String imagescategories = "$images/categories";
  static const String imagesitems = "$images/items";
  static const String profilepicture = "$images/profile";

  

  

  




}
