import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:senior_porj/core/class/handlingdataview.dart';
import 'package:senior_porj/core/class/statusrequest.dart';
import 'package:senior_porj/view/widget/customTextAuth/custombodytextaut.dart';
import 'package:senior_porj/view/widget/customTextAuth/logoauth.dart';

import '../../../../controller/auth/resertpaswword/verifycodesign_controller.dart';
import '../../../widget/customTextAuth/customtitletextauth.dart';

class VerifyCodeSign extends StatelessWidget {
  const VerifyCodeSign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
        Get.put(VerifyCodeSignControllerImp());
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(" Verification",
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: Colors.white)),
        backgroundColor: const Color.fromARGB(218, 9, 85, 206),
      ),
      body: GetBuilder<VerifyCodeSignControllerImp>(builder: (controller) => 
         HandlingDataRequest(statusRequest: controller.statusRequest, widget: 
      Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(
          children: [
            const LogoAuth(),
            const CusstomTitleTextAuth(
              titleText: "Check Code",
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomBodyTextAuth(text: "Please Enter The code Send To"),
            const SizedBox(
              height: 45,
            ),
            OtpTextField(
                fieldWidth: 50.0,
                borderRadius: BorderRadius.circular(20),
                numberOfFields: 5,
                borderColor: Color(0xFF512DA8),
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {},
                //runs when every textfield is filled
                onSubmit: (String verificationCodesign) {
                  controller.goToSuccessSignUp(verificationCodesign);
                }),
          ],
        ),
      ),))
    );
  }
}
