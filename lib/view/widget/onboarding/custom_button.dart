import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_porj/controller/onboarding_controller.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 80),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 0),
        textColor: Colors.white,
        onPressed: () {
          controller.next();
        },
        color: Colors.blue,
        child: Text("Continue"),
      ),
    );
  }
}
