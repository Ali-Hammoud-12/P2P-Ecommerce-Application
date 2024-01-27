import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_porj/core/class/statusrequest.dart';
import 'package:senior_porj/core/constant/routes.dart';
import 'package:senior_porj/data/datasource/remote/forgetpassword/checkemail.dart';

import '../../core/functions/handlingdata.dart';

abstract class ForgetPasswordController extends GetxController {
  checkemail();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  CheckEmailData checkEmailData = CheckEmailData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  StatusRequest statusRequest = StatusRequest.none;

  @override
  checkemail() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkEmailData.postdata(
        email.text,
      );
  
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.offNamed(AppRoute.verfiyCode, arguments: {"email": email.text});
        } else {
          Get.defaultDialog(
              title: "ُWarning", middleText: " Email Not Correct ");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
