import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/shopowner/addproduct_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../core/functions/validinput.dart';
import '../../core/shared/customdropdownsearch.dart';
import '../widget/shop/custombutton.dart';
import '../widget/shop/customtextfield.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  // static const appBarGradient = LinearGradient(
  //   colors: [Colors.blue],
  //   stops: [0.5, 1.0],
  // );

  @override
  Widget build(BuildContext context) {
    AddProductControllerImp controller = Get.put(AddProductControllerImp());
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
              'Add Product',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: GetBuilder<AddProductControllerImp>(
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
                                controller: controller.desc,
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
                                valid: (val) {
                                  return ValidInput(val!, 1, 8, "price");
                                },
                                isNumber: true,
                              ),
                              const SizedBox(height: 10),
                              CustomTextField(
                                controller: controller.count,
                                hintText: 'Quantity',
                                keyboardType: TextInputType.number,
                                valid: (val) {
                                  return ValidInput(val!, 1, 8, "quantity");
                                },
                                isNumber: true,
                              ),
                              const SizedBox(height: 10),
                              CustomTextField(
                                controller: controller.sprice,
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
                                text: 'Sell',
                                onTap: () => controller.addData(),
                              ),
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
