import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_porj/core/services/services.dart';
import 'package:senior_porj/data/datasource/static/static.dart';

import '../core/constant/routes.dart';

abstract class OnBoardingContoller extends GetxController {
  next();
  onPageChanged(int i);
}

class OnBoardingControllerImp extends OnBoardingContoller {
  late PageController pageController;
  int currentpage = 0;
  MyServices myServices = Get.find();
  @override
  next() {
    currentpage++;
    if (currentpage > onBoardingList.length - 1) {
      myServices.sharedPreferences.setString("step", "1");
      Get.offAllNamed(AppRoute.login);
    } else {
      pageController.animateToPage(currentpage,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int i) {
    currentpage = i;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
