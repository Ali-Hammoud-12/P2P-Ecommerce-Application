import 'package:get/get.dart';
import 'package:senior_porj/data/datasource/remote/orders/pending_data.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/constant/routes.dart';
import '../../../core/functions/handlingdata.dart';
import '../../../core/services/services.dart';
import '../../../data/datasource/remote/shop/ordersshop/ordersdata.dart';
import '../../../data/model/ordermodel.dart';

class OrdersPendingController extends GetxController {
  OrdersData ordersPendingData = OrdersData(Get.find());

  List<OrdersModel> data = [];

  StatusRequest statusRequest = StatusRequest.none;

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
    statusRequest = StatusRequest.loading;

    var response = await ordersPendingData
        .getPendingData(myServices.sharedPreferences.getString("id")!);

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
        if (data.isEmpty) {
          statusRequest = StatusRequest.none;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
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
