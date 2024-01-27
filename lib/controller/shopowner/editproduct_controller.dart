import 'dart:io';

import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_porj/controller/shopowner/viewproduct.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/functions/uploadfile.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/shop/category_data.dart';
import '../../data/datasource/remote/shop/items_data.dart';
import '../../data/model/categoriesmodel.dart';
import '../../data/model/itemsmodel.dart';

class EditProductControllerImp extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  ItemData itemsdata = ItemData(Get.find());

  List<SelectedListItem> dropdownlist = [];

  List<ItemsModel> data = [];

  late TextEditingController name;
  MyServices myServices = Get.find();
  late TextEditingController description;
  late TextEditingController image;
  late TextEditingController quantity;
  late TextEditingController price;
  late TextEditingController shipingprice;
  late TextEditingController discount;

  late TextEditingController dropdownname;
  late TextEditingController dropdownid;

  TextEditingController? catid;
  TextEditingController? catname;

  File? file;

  late ItemsModel itemsModel;

  StatusRequest statusRequest = StatusRequest.none;

  @override
  void onInit() {
    itemsModel = Get.arguments['itemsModel'];

    getCategory();
    name = TextEditingController();
    description = TextEditingController();
    image = TextEditingController();
    price = TextEditingController();
    shipingprice = TextEditingController();
    discount = TextEditingController();
    quantity = TextEditingController();

    dropdownid = TextEditingController();
    dropdownname = TextEditingController();

    catid = TextEditingController();
    catname = TextEditingController();

    name.text = itemsModel.itemsName!;
    description.text = itemsModel.itemsDescription!;
    price.text = itemsModel.itemsPrice!;
    shipingprice.text = itemsModel.itemsShipingPrice!;
    discount.text = itemsModel.itemsDiscount!;
    quantity.text = itemsModel.itemsQuantity!;

    // catid!.text = itemsModel.categoriesId!;
    // catname!.text = itemsModel.categoriesName!;

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

  editData() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;

      update();

      Map data = {
        "id": itemsModel.itemsId,
        "name": name.text,
        "uid": myServices.sharedPreferences.getString("id"),
        "desc": description.text,
        "count": quantity.text,
        "price": price.text,
        "sprice": shipingprice.text,
        "discount": discount.text,
        "catid": catid!.text,
        "active": "1",
        "imageold": itemsModel.itemsImage!,
      };
      var response = await itemsdata.edit(data, file);
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

  deleteItems(String id, String imagename) {
    itemsdata.delete({"id": id, "imagename": imagename});
    data.removeWhere((element) => element.itemsId == id);
    update();
  }
}
