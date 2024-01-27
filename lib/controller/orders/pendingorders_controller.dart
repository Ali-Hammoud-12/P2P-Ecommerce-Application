import 'package:get/get.dart';
import 'package:senior_porj/data/datasource/remote/orders/pending_data.dart';
import 'package:senior_porj/data/model/ordermodel.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/services/services.dart';

class PendingOrdersController extends GetxController {
  List<OrdersModel> data = [];
  PendingData pendingData = PendingData(Get.find());

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();
  
  String printPaymentMethod(String val) {
    if (val == "0") {
      return "Cash";
    } else {
      return "Payment Card";
    }
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "Await Approval";
    } else if (val == "1") {
      return "On The Way";
    } else {
      return "Archive";
    }
  }

  getOrders() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await pendingData
        .getData(myServices.sharedPreferences.getString("id")!);
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
   refrehOrder() {
    getOrders();
  }



  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
