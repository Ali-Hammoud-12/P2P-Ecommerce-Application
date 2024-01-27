import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdata.dart';
import '../../data/datasource/remote/shop/category_data.dart';
import '../../data/model/categoriesmodel.dart';

class ViewCategoryControllerImp extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  CategoryData categorysdata = CategoryData(Get.find());

  List<CategoriesModel> data = [];

  late StatusRequest statusRequest;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    statusRequest = StatusRequest.loading;

    var response = await categorysdata.get();

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List datalist = response['data'];
        data.addAll(datalist.map((e) => CategoriesModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }
}
