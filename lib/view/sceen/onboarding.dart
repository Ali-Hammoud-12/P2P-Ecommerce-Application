import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_porj/controller/onboarding_controller.dart';
import '../widget/onboarding/custom_button.dart';
import '../widget/onboarding/customslider.dart';
import '../widget/onboarding/dotboarding.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              flex: 3,
              child: CustomsliderOnBoarding(),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: const [
                    CustomDotControllerOnBoarding(),
                    Spacer(
                      flex: 2,
                    ),
                    CustomButtonOnBoarding(),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
