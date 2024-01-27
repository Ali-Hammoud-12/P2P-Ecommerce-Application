import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';

abstract class ShopController extends GetxController {
  int currentIndex = 0;
  addproducts();
  viewlistedproducts();
  analtyics();
  post();
  orders();
  profile();
}

class ShopControllerImp extends ShopController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  addproducts() {
    Get.toNamed(AppRoute.addProductScreen);
  }

  @override
  viewlistedproducts() {
    Get.toNamed(AppRoute.viewlistedproducts);
  }

  @override
  analtyics() {
    Get.toNamed(AppRoute.analtyicsScreen);
    currentIndex = 1;
  }

  @override
  orders() {
    Get.toNamed(AppRoute.ordersScreen);
    currentIndex = 2;
  }

  @override
  post() {
    Get.toNamed(AppRoute.postsScreen);
    currentIndex = 0;
  }

  @override
  profile() {
    Get.toNamed(AppRoute.ShopProfile);
    currentIndex = 3;
  }
}
