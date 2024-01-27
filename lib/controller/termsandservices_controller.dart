import 'package:get/get.dart';
import 'package:senior_porj/data/datasource/remote/termsandservices_data.dart';
import 'package:senior_porj/data/model/tasModel.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handlingdata.dart';
import '../core/services/services.dart';

class TermsController extends GetxController{
  
  TermsData termsData = TermsData(Get.find());

  List<TASModel> data = [];

   StatusRequest statusRequest = StatusRequest.none;

  MyServices myServices = Get.find();

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await termsData
        .getData();

    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
               List listdata = response['data'];
        data.addAll(listdata.map((e) => TASModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}