import 'dart:developer';

import 'package:get/get.dart';
import 'package:senior_porj/data/model/itemsmodel.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/orders/buyagain_data.dart';

class BuyAgainController extends GetxController {
  late ItemsModel itemModel;
  List data = [];
  BuyagainData buyagainData = BuyagainData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  getData() async {
    statusRequest = StatusRequest.loading;


    var response = await buyagainData.getData(myServices.sharedPreferences.getString("id")!);

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
  goToPageProductDetails(itemsModel , ) {
    Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel,});
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
