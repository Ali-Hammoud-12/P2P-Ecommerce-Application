
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handlingdata.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/myfavoritedatamodel.dart';
import '../data/model/favoritemodel.dart';

class MyFavoriteController extends GetxController {
  MyFavoriteData favoriteData = MyFavoriteData(Get.find());

  List<MyFavoriteModel> data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();


  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData
        .getData(myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => MyFavoriteModel.fromJson(e)));
        print("data");
        print(data);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  deleteFromFavorite(String favroiteid) {
    // data.clear();
    // statusRequest = StatusRequest.loading;
    var response = favoriteData.deleteData(favroiteid);
    data.removeWhere((element) => element.favoriteId == favroiteid);
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
