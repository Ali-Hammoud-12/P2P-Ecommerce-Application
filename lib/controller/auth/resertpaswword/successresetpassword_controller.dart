import 'package:get/get.dart';
import 'package:senior_porj/core/constant/routes.dart';

abstract class SuccessResetPasswordController extends GetxController {
  goToPageLogin();
}

class SuccessResetPasswordControllerImp extends SuccessResetPasswordController {
  @override
  goToPageLogin() {
    Get.offAllNamed(AppRoute.login);
  }
}
