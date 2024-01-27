import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/statusrequest.dart';
import '../../../core/functions/handlingdata.dart';
import '../../../core/services/services.dart';
import '../../../data/datasource/remote/shop/ordersshop/ordersdata.dart';
import '../../../data/model/ordermodel.dart';

class OrdersAcceptedController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  OrdersData ordersAcceptedData = OrdersData(Get.find());

  List<OrdersModel> data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  String printOrderType(String val) {
    if (val == "0") {
      return "delivery";
    } else {
      return "Recieved";
    }
  }

  String printPaymentMethod(String value) {
    if (value == "0") {
      return "Cash on Deliver";
    } else {
      return "Payment Card";
    }
  }

  getOrders() async {
    data.clear();
    if (formstate.currentState!.validate()) {
      update();



      statusRequest = StatusRequest.loading;
      var response = await ordersAcceptedData.getAcceptedData();
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        // Start backend
        if (response['status'] == "success") {
          List listdata = response['data'];
          data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
        } else {
          statusRequest = StatusRequest.failure;
        }
        // End
      }
      update();
    }
  }

  refreshOrders() {
    getOrders();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
