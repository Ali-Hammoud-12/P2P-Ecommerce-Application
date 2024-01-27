import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_porj/core/class/handlingdataview.dart';

import '../../../controller/orders/orderdetail_controller.dart';
import '../../../link_api.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    OrdersDetailsController controller = Get.put(OrdersDetailsController());
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
        padding: const EdgeInsets.all(10),
        child: GetBuilder<OrdersDetailsController>(
            builder: ((controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(children: [
                 const SizedBox(height: 50,),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          Table(
                            children: [
                              const TableRow(children: [
                                Text("Item",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold)),
                                Text("Name",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold)),
                                Text("QTY",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold)),
                                Text("Price",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold)),
                                Text("Shop And Status",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold)),
                                         Text("Status",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold)),
                              ]),
                             const TableRow(children: [
                              SizedBox(height: 30,),
                               SizedBox(height: 30,),
                                SizedBox(height: 30,),
                                 SizedBox(height: 30,),
                                  SizedBox(height: 30,),
                                  SizedBox(height: 30,),
                             ]),
                              ...List.generate(
                                  controller.data.length,
                                  (index) => 
                                  
                                  TableRow(children: [
                                        CachedNetworkImage(
                                          imageUrl:
                                              "${AppLink.imagesitems}/${controller.data[index].orderdetailsImage}",
                                          height: 70,
                                          width: 110,
                                          fit: BoxFit.fill,
                                        ),
                                        Text(
                                            "${controller.data[index].itemsName}",
                                            textAlign: TextAlign.center),
                                        Text(
                                            "${controller.data[index].orderdetailsQty}",
                                            textAlign: TextAlign.center),
                                        Text("${controller.data[index].price}",
                                            textAlign: TextAlign.center),
                                        Text(
                                            "${controller.data[index].usersName}",
                                            textAlign: TextAlign.center),
                                            Text(
                                              controller.printStatus(controller.data[index].orderdetailsApprove!),
                                            textAlign: TextAlign.center),
                                      ]))
                            ],
                          ),
                          const SizedBox(height: 20),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                                "Total Price : ${controller.ordersModel.ordersPrice }\$",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  ),
                 const SizedBox(height: 20,),
                  ListTile(
                    title: const Text("Shipping Address",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold)),
                    subtitle: Text(
                        "${controller.ordersModel.addressCity} ${controller.ordersModel.addressStreet}"),
                  ),
                 
                  
                ])))),
      ),
    );
  }
}
