import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_porj/data/datasource/remote/auth/shopownersignup.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdata.dart';

abstract class ShopOwnerSignUpController extends GetxController {
  shopownersignUp();
  goToSignIn();
}

class ShopOwnerSignUpControllerImp extends ShopOwnerSignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;

   StatusRequest statusRequest = StatusRequest.none;

  ShopOwnerSignupData shopownersignupData = ShopOwnerSignupData(Get.find());

  List data = [];

  @override
  shopownersignUp() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading; 
      update() ; 
      var response = await shopownersignupData.postdata(
          username.text, password.text, email.text, phone.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.offNamed(AppRoute.verfiyCodeSignUp  ,arguments: {
            "email" : email.text
          });
        } else {
          Get.defaultDialog(title: "ُWarning" , middleText: " Email Already Exists") ; 
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      
    }
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    username = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}
