import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_porj/controller/home_controller.dart';
import 'package:senior_porj/core/class/statusrequest.dart';
import 'package:senior_porj/core/services/services.dart';
import '../core/functions/handlingdata.dart';
import '../data/datasource/remote/itemsdata.dart';
import '../data/model/itemsmodel.dart';

abstract class ItemsController extends GetxController {
  intialData();
  changeCat(int val, String catval);
  getItems(String categoryid);
  goToPageProductDetails(ItemsModel itemsModel, String itemsid);
}

class ItemsControllerImp extends SearchMixController {
  List categories = [];
  String? catid;
  int? selectedCat;


  ItemsData testData = ItemsData(Get.find());

  List data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  @override
  void onInit() {
    search = TextEditingController();
    intialData();
    super.onInit();
  }

  @override
  intialData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedcat'];
    catid = Get.arguments['catid'];
    getItems(catid!);
  }

  @override
  changeCat(val, catval) {
    selectedCat = val;
    catid = catval;
    getItems(catid!);
    update();
  }

  @override
  getItems(categoryid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await testData.getData(
        categoryid, myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }


  goToPageProductDetails(
    itemsModel,
  ) {
    Get.toNamed("productdetails", arguments: {
      "itemsmodel": itemsModel,
    });
  }
}
