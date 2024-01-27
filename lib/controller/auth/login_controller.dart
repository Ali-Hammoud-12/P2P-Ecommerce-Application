import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_porj/core/class/statusrequest.dart';
import 'package:senior_porj/core/constant/routes.dart';

import '../../core/functions/handlingdata.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/auth/login.dart';

abstract class LoginController extends GetxController {
  login();
  goToChooseSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  LoginData loginData = LoginData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  bool isshowpassword = true;
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postdata(
        email.text,
        password.text,
      );
    
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          if (response['data']['users_approve'] == "1") {
            myServices.sharedPreferences
                .setString("id", response['data']['users_id']);
                 // ignore: unused_local_variable
                 String userid = myServices.sharedPreferences.getString("id")!;
            myServices.sharedPreferences
                .setString("username", response['data']['users_name']);
            myServices.sharedPreferences
                .setString("email", response['data']['users_email']);
            myServices.sharedPreferences
                .setString("phone", response['data']['users_phone']);
            myServices.sharedPreferences.setString("step", "2");
            Get.offNamed(AppRoute.homePage);
          } else {
            Get.toNamed(AppRoute.verfiyCodeSignUp,
                arguments: {"email": email.text});
          }

          // data.addAll(response['data']);

          if (response['data']['users_type'] == "2") {
            if (response['data']['users_approve'] == "1") {
              myServices.sharedPreferences
                  .setString("id", response['data']['users_id']);
                  
                   String userid = myServices.sharedPreferences.getString("id")!;
              myServices.sharedPreferences
              
                  .setString("username", response['data']['users_name']);
              myServices.sharedPreferences
                  .setString("email", response['data']['users_email']);
              myServices.sharedPreferences
                  .setString("phone", response['data']['users_phone']);
              myServices.sharedPreferences.setString("step", "3");

               FirebaseMessaging.instance.subscribeToTopic("users");
            FirebaseMessaging.instance.subscribeToTopic("users$userid");

              Get.offNamed(AppRoute.shopownerScreen);

            } else {
              Get.toNamed(AppRoute.verfiyCodeSignUp,
                  arguments: {"email": email.text});
            }
          }
        } else {
          Get.defaultDialog(
              title: "ُWarning", middleText: " Email Or Passwod Not Correct ");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  goToChooseSignUp() {
    Get.offNamed(AppRoute.chooseSignUp);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
     
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }
}
