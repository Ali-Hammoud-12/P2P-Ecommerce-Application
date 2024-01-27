import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_porj/core/class/statusrequest.dart';
import 'package:senior_porj/data/model/itemsmodel.dart';
import 'package:senior_porj/data/model/ratingmodel.dart';
import '../core/constant/routes.dart';
import '../core/functions/handlingdata.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/cartdata.dart';

abstract class ProductDetailsController extends GetxController {}

class ProductDetailsControllerImp extends ProductDetailsController {
  late ItemsModel itemsModel;

  CartData cartData = CartData(Get.find());

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  int countitems = 0;

  List<RatingModel> data = [];
  String? itid;

  intialData() async {
    statusRequest = StatusRequest.loading;

    countitems = await getCountItems(itemsModel.itemsId!);
    statusRequest = StatusRequest.success;
    update();
  }

  getCountItems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.getCountCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        int countitems = 0;
        countitems = int.parse(response['data']);
        print("==================================");
        print("$countitems");
        return countitems;
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
  }

  addItems(String itemsid) async {
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

  deleteitems(String itemsid) async {
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
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  List subitems = [
    {"name": "red", "id": 1, "active": '0'},
    {"name": "yallow", "id": 2, "active": '0'},
    {"name": "black", "id": 3, "active": '1'}
  ];

  add() {
    addItems(itemsModel.itemsId!);
    countitems++;
    update();
  }

  remove() {
    if (countitems > 0) {
      deleteitems(itemsModel.itemsId!);
      countitems--;
      update();
    }
  }

  submitRating(double rating, String comment, String itemsid, String usersid,
      ItemsModel itemsModel) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.rating(
        itemsid,
        myServices.sharedPreferences.getString("id")!,
        comment,
        rating.toString());
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  viewRating() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.viewRating(itemsModel.itemsId!);

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => RatingModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  goToItemsShop(
    ItemsModel itemsModel,
  ) {
    Get.offNamed(AppRoute.itemsshop, arguments: {
      "itemsmodel": itemsModel,
    });
  }

  @override
  void onInit() async {
    itemsModel = Get.arguments['itemsmodel'];
    intialData();
    viewRating();

    super.onInit();
  }
}
