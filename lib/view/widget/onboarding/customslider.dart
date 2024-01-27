import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_porj/controller/onboarding_controller.dart';

import '../../../data/datasource/static/static.dart';

class CustomsliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomsliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
        onPageChanged: (value) {
          controller.onPageChanged(value);
        },
        itemCount: onBoardingList.length,
        itemBuilder: ((context, index) => Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  onBoardingList[index].title!,
                  style: Theme.of(context).textTheme.headline1
                ),
                const SizedBox(
                  height: 50,
                ),
                Image.asset(
                  onBoardingList[index].image!,
                  height: 250,
                  width: 200,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  height: 80,
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    onBoardingList[index].body!,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1
                  ),
                )
              ],
            )));
  }
}
