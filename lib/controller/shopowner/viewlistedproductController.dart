import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_porj/core/services/services.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdata.dart';
import '../../data/datasource/remote/shop/items_data.dart';
import '../../data/model/itemsmodel.dart';

class ViewListedProductControllerImp extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  ItemData itemsdata = ItemData(Get.find());

  List<ItemsModel> data = [];

  List<SelectedListItem> dropdownlist = [];

  TextEditingController? search;

  MyServices myServices = Get.find();

  late StatusRequest statusRequest;

  @override
  void onInit() {
    getData();
    search = TextEditingController();
    super.onInit();
  }

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsdata
        .getListed(myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List datalist = response['data'];
        data.addAll(datalist.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  deleteItems(String id, String Imagename) {
    itemsdata.delete({"id": id, "imagename": Imagename});
    data.removeWhere((element) => element.itemsId == id);
    update();
    Get.offNamed(AppRoute.postsScreen);
  }
  
  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await itemsdata.searchListedItems(
        search!.text, myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        data.clear();
        List datalist = response['data'];
        data.addAll(datalist.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  bool isSearch = false;
  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    searchData();
    update();
  }


}
