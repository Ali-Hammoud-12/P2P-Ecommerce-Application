import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_porj/data/datasource/remote/profile.dart';
import 'package:senior_porj/data/model/usersmodel.dart';
import '../core/class/statusrequest.dart';
import '../core/constant/routes.dart';
import '../core/functions/handlingdata.dart';
import '../core/functions/uploadfile.dart';
import '../core/services/services.dart';

class ProfileController extends GetxController {
  ProfileData profileData = ProfileData(Get.find());
  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  List<UsersModel> datalist = [];

  File? file;

  chooseImageCamera() async {
    file = await imageUploadCamera();
    update();
    editData();
  }

  chooseImageGallery() async {
    file = await fileUploadGallery(false);
    update();
    editData();
  }

  showOptionImage() {
    // showBottomMenu(chooseImageCamera, chooseImageGallery);
    // print(datalist[0].usersImage);
  }

  getData(String userid) async {
    statusRequest = StatusRequest.loading;

    var response = await profileData.get(userid);

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List data = response['data'];
        datalist.addAll(data.map((e) => UsersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  editData() async {
    statusRequest = StatusRequest.loading;

    Map data = {
      "usersid": myServices.sharedPreferences.getString("id"),
      "imageold": datalist[0].usersImage!,
    };

    var response = await profileData.edit(data, file);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.offNamed(AppRoute.Profile);
        ProfileController pc = Get.find();
        pc.getData(myServices.sharedPreferences.getString("id")!);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

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

  @override
  void onInit() {
    getData(myServices.sharedPreferences.getString("id")!);
    super.onInit();
  }
}
