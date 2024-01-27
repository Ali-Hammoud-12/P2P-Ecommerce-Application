import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/shopowner/ordersShop/ShopOrderdetailsController.dart';
import '../../core/class/handlingdataview.dart';
import '../../link_api.dart';

class ShopOrderDetails extends StatelessWidget {
  const ShopOrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ShopOrderDetailsController controller =
        Get.put(ShopOrderDetailsController());
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.blue),
          backgroundColor: Colors.grey[50],
          title: const Text(
            "Order Details",
            style: TextStyle(
                color: Colors.blue, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: GetBuilder<ShopOrderDetailsController>(
              builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(
                  children: [
                    Card(
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: Table(
                              children: [
                                const TableRow(children: [
                                  Text(
                                    "Product",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Name",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "QTY",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Price",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Approve",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ]),
                                const TableRow(children: [
                                  SizedBox(
                                    height: 25,
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                ]),
                                ...List.generate(
                                    controller.data.length,
                                    (index) => TableRow(children: [
                                          CachedNetworkImage(
                                            imageUrl:
                                                "${AppLink.imagesitems}/${controller.data[index].orderdetailsImage}",
                                            height: 70,
                                            width: 110,
                                            fit: BoxFit.fill,
                                          ),
                                          Text(
                                            "${controller.data[index].itemsName}",
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            "${controller.data[index].orderdetailsQty}",
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            "${controller.data[index].totalprice}\$",
                                            textAlign: TextAlign.center,
                                          ),
                                          controller.data[index].orderdetailsapprove == "0" ? MaterialButton(
                                            onPressed: () {
                                              controller.approveOrders(
                                                  controller.ordersModel
                                                      .ordersUsersid!,
                                                  controller.data[index]
                                                      .orderdetailsOid!,
                                                  controller.data[index]
                                                      .orderdetailsItemsid!);
                                            },
                                            color: Colors.blue,
                                            child: const Text("Approve",style: TextStyle(fontSize: 8,color: Colors.white),),
                                          ): const Text("Approved",style: TextStyle(fontSize: 13,color: Colors.blue),textAlign: TextAlign.center,),
                                        ]))
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ...List.generate(
                            controller.data2.length,
                            (index) => Text(
                              "Total Price: ${controller.data2[index].totalprice}\$",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    ...List.generate(
                        controller.data2.length,
                        (index) => Column(
                              children: [
                                Card(
                                    child: Container(
                                  child: ListTile(
                                    title: const Text(
                                      "Customer",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(
                                        "Name: ${controller.data2[index].usersName!}"),
                                  ),
                                )),
                                Card(
                                    child: Container(
                                  child: ListTile(
                                    title: const Text(
                                      "Shiping Address",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(
                                        "${controller.data2[index].addressStreet} - ${controller.data2[index].addressCity} - ${controller.data2[index].addressCountry}"),
                                  ),
                                )),
                              ],
                            ))
                  ],
                ),
              ),
            )));
  }
}
