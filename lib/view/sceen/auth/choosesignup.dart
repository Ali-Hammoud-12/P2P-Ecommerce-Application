import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_porj/controller/auth/choosesignup_controller.dart';
import 'package:senior_porj/view/widget/customTextAuth/custombuttonauth.dart';

class ChooseSignUp extends StatelessWidget {
  const ChooseSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    ChooseSignUpControllerImp controller = Get.put(ChooseSignUpControllerImp());
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButtonAuth(
              text: "Sign Up As Customer",
              onpressed: () {
                controller.signupCustomer();
              },
            ),
            CustomButtonAuth(
              text: "Sign Up As Shop Owner",
              onpressed: () {
                controller.signupShopOwner();
              },
            ),
          ],
        ),
      ),
    );
  }
}
