import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_porj/core/class/handlingdataview.dart';
import 'package:senior_porj/view/widget/customTextAuth/customtextformauth.dart';
import 'package:senior_porj/view/widget/customTextAuth/logoauth.dart';
import '../../../../controller/auth/resertpaswword/changepassword_controller.dart';
import '../../../../core/functions/validinput.dart';
import '../../../widget/customTextAuth/custombuttonauth.dart';
import '../../../widget/customTextAuth/customtitletextauth.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        Get.put(ChangePasswordController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(" Change Password",
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: Colors.white)),
        backgroundColor: const Color.fromARGB(218, 9, 85, 206),
      ),
      body: GetBuilder<ChangePasswordController>(builder: (controller) =>
      HandlingDataRequest(statusRequest: controller.statusRequest, widget:
       Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
          key: controller.formstate,
          child: ListView(
            children: [
              const LogoAuth(),
              const CusstomTitleTextAuth(
                titleText: "Please Enter New Password",
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextFormAuth(
                  isNumber: false,
                  valid: (val) {
                    return ValidInput(val!, 8, 100, "password");
                  },
                  labeltext: "password",
                  inconData: Icons.lock,
                  mycontroller: controller.password),
              CustomTextFormAuth(
                  isNumber: false,
                  valid: (val) {
                    return ValidInput(val!, 8, 100, "password");
                  },
                  labeltext: "Confirm Your Password",
                  inconData: Icons.lock,
                  mycontroller: controller.repassword),
              CustomButtonAuth(
                text: "Save New password",
                onpressed: () {
                  controller.resetPassword();
                },
              ),
            ],
          ),
        ),
      ),))
    );
  }
}
