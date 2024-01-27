import 'package:get/get.dart';
import 'package:senior_porj/data/model/orderdetailsModel.dart';
import 'package:senior_porj/data/model/ordermodel.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdata.dart';
import '../../data/datasource/remote/orders/details.dart';

class OrdersDetailsController extends GetxController {
  late OrdersModel ordersModel;
  List<OrderDetailsModel> data = [];
  DetailsData detailsData = DetailsData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  getData() async {
    statusRequest = StatusRequest.loading;

    var response = await detailsData.getDetails(ordersModel.ordersId!);

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => OrderDetailsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  String printStatus(String val) {
    if (val == "0") {
      return "Await Approval";
    } else if (val == "1") {
      return "Approved";
    } else {
      return "Dennied";
    }
  }

  @override
  void onInit() {
    ordersModel = Get.arguments['ordersmodel'];
    getData();
    super.onInit();
  }
}
