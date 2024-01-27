import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_porj/controller/auth/forgotpassword_cotroller.dart';
import 'package:senior_porj/core/class/handlingdataview.dart';
import 'package:senior_porj/core/class/statusrequest.dart';
import 'package:senior_porj/core/functions/validinput.dart';
import 'package:senior_porj/view/widget/customTextAuth/custombodytextaut.dart';

import 'package:senior_porj/view/widget/customTextAuth/customtextformauth.dart';
import 'package:senior_porj/view/widget/customTextAuth/logoauth.dart';
import '../../../widget/customTextAuth/custombuttonauth.dart';
import '../../../widget/customTextAuth/customtitletextauth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: Text(" Forget Password",
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(color: Colors.white)),
          backgroundColor: const Color.fromARGB(218, 9, 85, 206),
        ),
        body: GetBuilder<ForgetPasswordControllerImp>(
            builder: (controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    height: double.infinity,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                    child: Form(
                      key: controller.formstate,
                      child: ListView(
                        children: [
                          const LogoAuth(),
                          const CusstomTitleTextAuth(
                            titleText: "Check Your Email",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const CustomBodyTextAuth(
                              text:
                                  "Please Enter Your Email Address To Receive A Verification Code"),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomTextFormAuth(
                              valid: (val) {
                                return ValidInput(val!, 8, 100, "email");
                              },
                              isNumber: false,
                              labeltext: "Email",
                              inconData: Icons.email_outlined,
                              mycontroller: controller.email),
                          CustomButtonAuth(
                            text: "Check",
                            onpressed: () {
                              controller.checkemail();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                )));
  }
}
