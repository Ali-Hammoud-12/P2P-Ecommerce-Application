import 'package:get/get.dart';

import '../../../core/class/statusrequest.dart';
import '../../../core/constant/routes.dart';
import '../../../core/functions/handlingdata.dart';
import '../../../core/services/services.dart';
import '../../../data/datasource/remote/shop/ordersshop/ordersdata.dart';
import '../../../data/model/ordermodel.dart';
import '../../../data/model/shoporderdetailsmodel.dart';
import '../../../data/model/shoporderdetailsmodel2.dart';

class ShopOrderDetailsController extends GetxController {
  OrdersData ordersData = OrdersData(Get.find());

  List<ShopOrderDetailsModel> data = [];
  List<ShopOrderDetailsModel2> data2 = [];

  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  late OrdersModel ordersModel;

  @override
  void onInit() {
    ordersModel = Get.arguments['ordersmodel'];
    getOrder();
    getOrder2();
    super.onInit();
  }

  getOrder2() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.getorderDetailsData2(
        myServices.sharedPreferences.getString("id")!, ordersModel.ordersId!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        data2.addAll(listdata.map((e) => ShopOrderDetailsModel2.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  getOrder() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.getorderDetailsData(
        myServices.sharedPreferences.getString("id")!, ordersModel.ordersId!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => ShopOrderDetailsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  approveOrders(String userid, String orderid, String itemsid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.approveOrder(userid, orderid, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.offNamed(AppRoute.shopordersdetails);
        ShopOrderDetailsController sp = Get.find();
        sp.getOrder();
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }
}
