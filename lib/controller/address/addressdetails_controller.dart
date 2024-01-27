import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_porj/controller/address/view_controller.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/address_data.dart';

class AddAddressDetailsController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;

  AddressData addressData = AddressData(Get.find());

  MyServices myServices = Get.find();

  late TextEditingController name;
  late TextEditingController city;
  late TextEditingController street;

  final country = "Lebanon".obs;

  var listType = ["Lebanon", "China", "USA", "Canada"];

  void setSelected(String value) {
    country.value = value;
  }

  intialData() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
  }

  addAddress() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await addressData.addData(
        myServices.sharedPreferences.getString("id")!,
        name.text,
        city.text,
        street.text,
        country.toString());

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        if (myServices.sharedPreferences.getString("step") == "2") {
          Get.offNamed(AppRoute.homePage);
        } else if (myServices.sharedPreferences.getString("step") == "3") {
          Get.offNamed(AppRoute.ShopProfile);
        }
        AddressViewController av = Get.find();
        av.getData();
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }

  @override
  void dispose() {
    intialData();
    super.dispose();
  }
}
