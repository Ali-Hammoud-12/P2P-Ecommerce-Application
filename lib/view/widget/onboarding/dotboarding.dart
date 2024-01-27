
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_porj/controller/onboarding_controller.dart';

import '../../../data/datasource/static/static.dart';

class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
        builder: ((controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    onBoardingList.length,
                    (index) => AnimatedContainer(
                          margin: const EdgeInsets.only(right: 3),
                          duration: const Duration(milliseconds: 900),
                          width: controller.currentpage==index ? 25:5,
                          height: 6,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)),
                        )),
              ],
            )));
  }
}
