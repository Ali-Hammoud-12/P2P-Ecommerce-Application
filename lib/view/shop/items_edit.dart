
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/shopowner/editproduct_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/validinput.dart';
import '../../core/shared/customdropdownsearch.dart';
import '../widget/shop/custombutton.dart';
import '../widget/shop/customtextfield.dart';

class ItemsEdit extends StatelessWidget {
  const ItemsEdit({super.key});

  // static const appBarGradient = LinearGradient(
  //   colors: [Colors.blue],
  //   stops: [0.5, 1.0],
  // );

  @override
  Widget build(BuildContext context) {
    EditProductControllerImp controller = Get.put(EditProductControllerImp());
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
               // gradient: appBarGradient,
              ),
            ),
            title: const Text(
              'Edit Product',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: GetBuilder<EditProductControllerImp>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView(
                    children: [
                      Form(
                        key: controller.formstate,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            children: [
                              const SizedBox(height: 20),
                              CustomTextField(
                                controller: controller.name,
                                keyboardType: TextInputType.name,
                                hintText: 'Product Name',
                                valid: (val) {
                                  return ValidInput(val!, 1, 55, "Pname");
                                },
                                isNumber: false,
                              ),
                              const SizedBox(height: 10),
                              CustomTextField(
                                controller: controller.description,
                                keyboardType: TextInputType.text,
                                hintText: 'Description',
                                valid: (val) {
                                  return ValidInput(val!, 1, 300, "desc");
                                },
                                isNumber: false,
                                maxLines: 7,
                              ),
                              const SizedBox(height: 10),
                              CustomTextField(
                                controller: controller.price,
                                keyboardType: TextInputType.number,
                                hintText: 'Price',
                                isNumber: true,
                                valid: (val) {
                                  return ValidInput(val!, 1, 8, "price");
                                },
                              ),
                              const SizedBox(height: 10),
                              CustomTextField(
                                controller: controller.quantity,
                                hintText: 'Quantity',
                                valid: (val) {
                                  return ValidInput(val!, 1, 8, "quantity");
                                },
                                keyboardType: TextInputType.number,
                                isNumber: true,
                              ),
                              const SizedBox(height: 10),
                              CustomTextField(
                                controller: controller.shipingprice,
                                keyboardType: TextInputType.number,
                                hintText: 'Shipping Price',
                                valid: (val) {
                                  return ValidInput(val!, 1, 8, "ShipingPrice");
                                },
                                isNumber: true,
                              ),
                              const SizedBox(height: 10),
                              CustomTextField(
                                controller: controller.discount,
                                keyboardType: TextInputType.number,
                                hintText: 'Discount',
                                valid: (val) {
                                  return ValidInput(val!, 1, 8, "discount");
                                },
                                isNumber: true,
                              ),
                              const SizedBox(height: 15),
                              CustomDropDownSearch(
                                  title: "Choose a Category",
                                  listdata: controller.dropdownlist,
                                  dropdownSelecredName: controller.catname!,
                                  dropdownSelecredId: controller.catid!),
                              const SizedBox(height: 15),
                              Container(
                                width: double.infinity,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: MaterialButton(
                                  color: Colors.blue,
                                  textColor: Colors.white,
                                  child: const Text("Choose Item Image"),
                                  onPressed: () {
                                    controller.showOptionImage();
                                  },
                                ),
                              ),
                              if (controller.file != null)
                                Image.file(controller.file!,
                                    width: 200, height: 200),
                              const SizedBox(height: 10),
                              CustomButton(
                                text: 'Update',
                                onTap: () => controller.editData(),
                              ),
                              const SizedBox(height: 15),
                              CustomButton(
                                  text: 'Delete',
                                  color: Colors.red,
                                  onTap: () {
                                    Get.defaultDialog(
                                        title: "Warning",
                                        middleText:
                                            "Are you sure you want to remove this item?",
                                        onCancel: () {},
                                        onConfirm: () {
                                          controller.deleteItems(
                                              controller.itemsModel.itemsId!,
                                              controller
                                                  .itemsModel.itemsImage!);
                                          Get.offAllNamed(
                                              AppRoute.shopownerScreen);
                                        });
                                  }),
                              const SizedBox(height: 15),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )));
  }
}
