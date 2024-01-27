import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_porj/core/services/services.dart';

import '../../../core/class/statusrequest.dart';
import '../../../core/constant/routes.dart';
import '../../../core/functions/handlingdata.dart';
import '../../../data/datasource/remote/forgetpassword/resetpassword.dart';

class ChangePasswordController extends GetxController {
  MyServices myServices = Get.find();
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController password;

  late TextEditingController repassword;
  StatusRequest statusRequest = StatusRequest.none;

  @override
  resetPassword() async {
    if (password.text != repassword.text) {
      return Get.defaultDialog(
          title: "Warning", middleText: "Password Not match");
    }
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.change(
        myServices.sharedPreferences.getString("id")!,
        password.text,
      );
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          if (myServices.sharedPreferences.getString("step") == "2") {
            Get.offNamed(AppRoute.homePage);
            Get.snackbar("Success", "You Change your Password");
          } else if (myServices.sharedPreferences.getString("step") == "3") {
            Get.offNamed(AppRoute.ShopProfile);
            Get.snackbar("Success", "You Change your Password");
          }
        } else {
          Get.defaultDialog(title: "ُWarning", middleText: "Try Again ");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
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
