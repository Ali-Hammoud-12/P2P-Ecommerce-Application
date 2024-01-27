import 'package:get/get.dart';
import 'package:senior_porj/view/sceen/address/add.dart';
import 'package:senior_porj/view/sceen/address/view.dart';
import 'package:senior_porj/view/sceen/auth/Login.dart';
import 'package:senior_porj/view/sceen/auth/choosesignup.dart';
import 'package:senior_porj/view/sceen/auth/resetpassword/changepassword.dart';
import 'package:senior_porj/view/sceen/auth/resetpassword/resetpassword.dart';
import 'package:senior_porj/view/sceen/auth/resetpassword/forgotpassword.dart';
import 'package:senior_porj/view/sceen/auth/resetpassword/verifycode.dart';
import 'package:senior_porj/view/sceen/auth/resetpassword/verifycodesignup.dart';
import 'package:senior_porj/view/sceen/auth/signup.dart';
import 'package:senior_porj/view/sceen/auth/resetpassword/success_resetpassword.dart';
import 'package:senior_porj/view/sceen/auth/singupshopowner.dart';
import 'package:senior_porj/view/sceen/auth/success_signup.dart';
import 'package:senior_porj/view/sceen/cart.dart';
import 'package:senior_porj/view/sceen/checkout.dart';
import 'package:senior_porj/view/sceen/favorite.dart';
import 'package:senior_porj/view/sceen/homescreen.dart';
import 'package:senior_porj/view/sceen/items.dart';
import 'package:senior_porj/view/sceen/itemsShop.dart';
import 'package:senior_porj/view/sceen/notification.dart';
import 'package:senior_porj/view/sceen/onboarding.dart';
import 'package:senior_porj/view/sceen/orders/buyAgain.dart';
import 'package:senior_porj/view/sceen/orders/details.dart';
import 'package:senior_porj/view/sceen/orders/pending.dart';
import 'package:senior_porj/view/sceen/productdetails.dart';
import 'package:senior_porj/view/sceen/profile.dart';
import 'package:senior_porj/view/sceen/settings.dart';
import 'package:senior_porj/view/sceen/termsandservices.dart';
import 'package:senior_porj/view/shop/analyticsSreen.dart';
import 'package:senior_porj/view/shop/listedproducts.dart';
import 'package:senior_porj/view/shop/orders_screen.dart';
import 'package:senior_porj/view/shop/post_screen.dart';
import 'package:senior_porj/view/shop/shop_profile.dart';
import 'package:senior_porj/view/shop/shoporderdetail.dart';
import 'core/constant/routes.dart';
import 'core/middleware/mymiddleware.dart';
import 'view/shop/addproduct.dart';
import 'view/shop/items_edit.dart';
import 'view/shop/shopownerscreen.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const OnBoarding(), middlewares: [MyMiddleWare()] ),


  // Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.chooseSignUp, page: () => const ChooseSignUp()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.shopOwnerSignUp, page: () => const ShopOwnerSignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerifyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
   GetPage(name: AppRoute.changepassword, page: () => const ChangePassword()),
  GetPage(
      name: AppRoute.successResetpassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  GetPage(name: AppRoute.verfiyCodeSignUp, page: () => const VerifyCodeSign()),
  //Customer Home
  GetPage(name: AppRoute.homePage, page: () => const HomeScreen()),
  GetPage(name: AppRoute.items, page: () => const Items()),
  GetPage(name: AppRoute.productdetails, page: () => const ProductDetails()),
  GetPage(name: AppRoute.myfavorite, page: () => const FavoritePage()),
  //===========ShopItems
  GetPage(name: AppRoute.itemsshop, page: () => const ItemsShop()),
  //==============Cart
  GetPage(name: AppRoute.cart, page: () => const Cart()),
  //=============Address========
  GetPage(name: AppRoute.addressview, page: () => const AddressView()),
  GetPage(name: AppRoute.addressadd, page: () => const AddressAdd()),
  //=============Checkout===
  GetPage(name: AppRoute.checkout, page: () => const Checkout()),
  //=============Terms And Services=============
  GetPage(name: AppRoute.termsandservices, page: () => const TermsAndServices()),

  //================Orders
  GetPage(name: AppRoute.pendingorders, page: () => const PendingOrders()),
  GetPage(name: AppRoute.buyagain, page: () => const BuyAgain()),
  GetPage(name: AppRoute.orderdetails, page: () => const OrdersDetails()),

  //================Notification
  GetPage(name: AppRoute.notificationpage, page: () => const NotificationPage()),

  //====================Settings
   GetPage(name: AppRoute.settings, page: () => const Settings()),

   GetPage(name: AppRoute.Profile, page: () => const Profile()),
  
  //====================ShopownerScreen
  GetPage(name: AppRoute.shopownerScreen, page: () => const ShopownerScreen()),
  GetPage(name: AppRoute.analtyicsScreen, page: () => const AnaltyicsScreen()),
  GetPage(name: AppRoute.addProductScreen, page: () => const AddProductScreen()),
  GetPage(name: AppRoute.viewlistedproducts, page: () => const ListedProductsScreen()),
  GetPage(name: AppRoute.ordersScreen, page: () => const OrderScreen()),
  GetPage(name: AppRoute.shopordersdetails, page: () => const ShopOrderDetails()),
  GetPage(name: AppRoute.postsScreen, page: () => const PostsScreen()),
  GetPage(name: AppRoute.ShopProfile, page: () => const ShopProfile()),
  GetPage(name: AppRoute.itemsedit, page: () => const ItemsEdit()),





];
