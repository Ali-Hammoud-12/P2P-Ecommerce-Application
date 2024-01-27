import 'package:get/get.dart';
import 'package:senior_porj/data/datasource/remote/itemsdata.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handlingdata.dart';
import '../data/model/itemsmodel.dart';

class ShopItemsController extends GetxController {
  late ItemsModel itemsModel;
  List data = [];
  ItemsData itemsData = ItemsData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  getData() async {
    statusRequest = StatusRequest.loading;

    var response = await itemsData.viewItems(
      itemsModel.itemsUsersid!
    );

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
    itemsModel = Get.arguments['itemsmodel'];
    getData();
    super.onInit();
  }
}
