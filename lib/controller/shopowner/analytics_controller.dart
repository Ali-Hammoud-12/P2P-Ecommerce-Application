import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_porj/core/services/services.dart';
import 'package:senior_porj/data/model/analyticsmodel.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdata.dart';
import '../../data/datasource/remote/shop/items_data.dart';

class AnalyticsControllerImp extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  ItemData itemsdata = ItemData(Get.find());

  MyServices myServices = Get.find();

  List<AnalyticsModel> data = [];

  List<AnalyticsTotalModel> datatotal = [];

  late StatusRequest statusRequest;

  @override
  void onInit() {
    getData();
    getTotalData();
    super.onInit();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await itemsdata
        .analyticsview(myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List datalist = response['data'];
        data.addAll(datalist.map((e) => AnalyticsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  getTotalData() async {
    statusRequest = StatusRequest.loading;
    var response = await itemsdata
        .analyticstotalview(myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List datalist = response['data'];
        datatotal.addAll(datalist.map((e) => AnalyticsTotalModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }
}
