import 'dart:io';

import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/functions/uploadfile.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/shop/category_data.dart';
import '../../data/datasource/remote/shop/items_data.dart';
import '../../data/model/categoriesmodel.dart';
import 'viewproduct.dart';

class AddProductControllerImp extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  ItemData itemsdata = ItemData(Get.find());

  List<SelectedListItem> dropdownlist = [];

  late TextEditingController name;
  MyServices myServices = Get.find();
  late TextEditingController desc;
  late TextEditingController imagename;
  late TextEditingController count;
  late TextEditingController price;
  late TextEditingController sprice;
  late TextEditingController discount;

  late TextEditingController dropdownname;
  late TextEditingController dropdownid;

  TextEditingController? catid;
  TextEditingController? catname;

  File? file;

  StatusRequest statusRequest = StatusRequest.none;

  @override
  void onInit() {
    getCategory();
    name = TextEditingController();
    desc = TextEditingController();
    imagename = TextEditingController();
    price = TextEditingController();
    sprice = TextEditingController();
    discount = TextEditingController();
    count = TextEditingController();

    dropdownid = TextEditingController();
    dropdownname = TextEditingController();

    catid = TextEditingController();
    catname = TextEditingController();

    super.onInit();
  }

  chooseImageCamera() async {
    file = await imageUploadCamera();
    update();
  }

  chooseImageGallery() async {
    file = await fileUploadGallery(false);
    update();
  }

  showOptionImage() {
    showBottomMenu(chooseImageCamera, chooseImageGallery);
  }

  getCategory() async {
    CategoryData categoryData = CategoryData(Get.find());
    statusRequest = StatusRequest.loading;
    var response = await categoryData.get();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List<CategoriesModel> data = [];
        List datalist = response['data'];
        data.addAll(datalist.map((e) => CategoriesModel.fromJson(e)));

        for (int i = 0; i < data.length; i++) {
          dropdownlist.add(SelectedListItem(
              name: data[i].categoriesName!, value: data[i].categoriesId));
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  addData() async {
    if (formstate.currentState!.validate()) {
      if (file == null) {
        Get.snackbar("Warning", "Please choose an Image");
        Get.offNamed(AppRoute.addProductScreen);
        return;
      }

      update();

      Map data = {
        "name": name.text,
        "uid": myServices.sharedPreferences.getString("id"),
        "desc": desc.text,
        "count": count.text,
        "price": price.text,
        "sprice": sprice.text,
        "discount": discount.text,
        "catid": catid!.text,
        "active": "0"
      };

      statusRequest = StatusRequest.loading;
      var response = await itemsdata.add(data, file!);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        // Start backend
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.shopownerScreen);
          ViewProductControllerImp vp = Get.find();
          vp.getData();
        } else {
          statusRequest = StatusRequest.failure;
        }
        // End
      }
      update();
    }
  }

  dropDownFunction(context) {
    DropDownState(
      DropDown(
        bottomSheetTitle: const Text(
          "kCities",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: [SelectedListItem(name: "a"), SelectedListItem(name: "b")],
        selectedItems: (List<dynamic> selectedList) {
          SelectedListItem selectedListItem = selectedList[0];
          dropdownname.text = selectedListItem.name;
          // showSnackBar(list.toString());
        },
        // enableMultipleSelection: true,
      ),
    ).showModal(context);
  }
}
