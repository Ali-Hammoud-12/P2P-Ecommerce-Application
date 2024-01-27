import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_porj/core/class/statusrequest.dart';
import 'package:senior_porj/core/constant/routes.dart';
import 'package:senior_porj/data/datasource/remote/forgetpassword/resetpassword.dart';

import '../../../core/functions/handlingdata.dart';

abstract class ResetPasswordController extends GetxController {
  
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController password;

  late TextEditingController repassword;
  StatusRequest statusRequest = StatusRequest.none;
  String? email;

 

  @override
  goToSuccessResetPassword() async {
    if (password.text != repassword.text) {
      return Get.defaultDialog(
          title: "Warning", middleText: "Password Not match");
    }
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.postdata(
        email!,
        password.text,
      );
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.offNamed(AppRoute.successResetpassword,
              arguments: {"email": email});
        } else {
          Get.defaultDialog(title: "ُWarning", middleText: " Try Again ");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } 
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }
}
