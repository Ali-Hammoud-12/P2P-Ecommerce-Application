import 'package:get/get.dart';

import '../functions/fcmconfig.dart';
import '../services/services.dart';

class LocaleController extends GetxController {
  MyServices myServices = Get.find();
  @override
  void onInit() {
    requestPermissionNotification() ; 
    fcmconfig();
    super.onInit();
  }
}
