import 'package:get/get.dart';
import 'package:senior_porj/core/constant/routes.dart';

abstract class ChooseSignUpController extends GetxController {
  // ignore: non_constant_identifier_names
  signupCustomer();
  // ignore: non_constant_identifier_names
  signupShopOwner();
}

class ChooseSignUpControllerImp extends ChooseSignUpController {
 
  @override
  signupCustomer() {
    Get.offNamed(AppRoute.signUp);
  }

 
  @override
  signupShopOwner() {
    Get.offNamed(AppRoute.shopOwnerSignUp);
  }
}
