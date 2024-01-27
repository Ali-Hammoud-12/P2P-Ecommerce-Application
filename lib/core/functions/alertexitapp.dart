import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future <bool> alertExitApp() {
  Get.defaultDialog(
      title: "Warning",
      middleText: "Do You Want To Close The App",
      actions: [
        ElevatedButton(
          onPressed: () {
            exit(0);
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
  return Future.value(true);
}
