import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_porj/core/constant/routes.dart';

import '../../../core/class/statusrequest.dart';
import '../../../core/functions/handlingdata.dart';
import '../../../data/datasource/remote/auth/verifycodesign.dart';

abstract class VerifyCodeSignController extends GetxController {
  checkCode();
  goToSuccessSignUp(String verificationCodesign);
}

class VerifyCodeSignControllerImp extends VerifyCodeSignController {
  VerifyCodesignData verifyCodesignData = VerifyCodesignData(Get.find());

  String? email;
  StatusRequest statusRequest = StatusRequest.none;
  @override
  checkCode() {}

  @override
  goToSuccessSignUp(verificationCodesign) async {
    statusRequest = StatusRequest.loading;
    update();

    var response =
        await verifyCodesignData.postdata(email!, verificationCodesign);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoute.successSignUp);
      } else {
        Get.defaultDialog(
            title: "ُWarning", middleText: "Verify Code not Correct");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  reSend() {
    verifyCodesignData.resendData(email!);
  }
}
