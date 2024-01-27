import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_porj/core/constant/routes.dart';
import 'package:senior_porj/core/services/services.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();

  logout() {
    Get.defaultDialog(
        title: "logout",
        middleText: "Do You Want To Logout",
        actions: [
          ElevatedButton(
            onPressed: () {
                String userid = myServices.sharedPreferences.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users${userid}");
              myServices.sharedPreferences.clear();
              Get.offAllNamed(AppRoute.login);
            },
            child: const Text("Yes"),
          ),
          ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: const Text("Cancel"),
          ),
        ]);
  }
}
