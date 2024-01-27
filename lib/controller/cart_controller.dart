import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_porj/core/class/statusrequest.dart';
import 'package:senior_porj/core/constant/routes.dart';
import 'package:senior_porj/core/functions/handlingdata.dart';
import 'package:senior_porj/core/services/services.dart';

import '../data/datasource/remote/cartdata.dart';
import '../data/model/cartmodel.dart';

class CartController extends GetxController {
  CartData cartData = CartData(Get.find());

  StatusRequest statusRequest =  StatusRequest.none;

  MyServices myServices = Get.find();

  List<CartModel> data = [];

  double priceorders = 0.0;

  int totalcountitems = 0;
  double shippingprice = 0.0;
  double total = 0.0;

  add(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.snackbar(
          "Added",
          "",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          borderRadius: 10,
          backgroundColor: Colors.blue,
        );
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  delete(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.deleteCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.snackbar(
          "Removed",
          "",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          borderRadius: 10,
          backgroundColor: Colors.blue,
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  resetVarCart() {
    totalcountitems = 0;
    priceorders = 0.0;
    data.clear();
  }

  refreshPage() {
    resetVarCart();
    view();
  }

  view() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await cartData.viewCart(myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        if (response['datacart']['status'] == 'success') {
          List dataresponse = response['datacart']['data'];
          Map dataresponsecountprice = response['countprice'];
          data.clear();
          data.addAll(dataresponse.map((e) => CartModel.fromJson(e)));
          totalcountitems = int.parse(dataresponsecountprice['totalcount']);
          priceorders = double.parse(dataresponsecountprice['totalprice']);
          shippingprice = double.parse(dataresponsecountprice['shippingprice']);
          total = double.parse(dataresponsecountprice['total']);

          print(priceorders);
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  goToCheckout() {
    if (data.isEmpty) {
      Get.snackbar("Warning", "Your Card is Empty");
    } else {
      Get.toNamed(AppRoute.checkout, arguments: {
        "priceorder": priceorders.toString(),
        "shippingprice": shippingprice.toString(),
        "total": total.toString(),
      });
    }
  }

  @override
  void onInit() {
    view();
    super.onInit();
  }
}
