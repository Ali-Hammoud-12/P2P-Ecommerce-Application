import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_porj/core/constant/routes.dart';
import 'package:senior_porj/core/services/services.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 0;

  MyServices myServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString("step") == "1") {
      return const RouteSettings(name: AppRoute.login);
    }
    if (myServices.sharedPreferences.getString("step") == "2") {
      return const RouteSettings(name: AppRoute.homePage);
    }
     if (myServices.sharedPreferences.getString("step") == "3") {
      return const RouteSettings(name: AppRoute.shopownerScreen);
    }
     return null;
  }
}
