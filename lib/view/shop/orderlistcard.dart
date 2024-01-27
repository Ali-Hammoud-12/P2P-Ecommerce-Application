
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/shopowner/ordersShop/orderspending.dart';
import '../../core/constant/routes.dart';
import '../../data/model/ordermodel.dart';


class CardOrderList extends GetView<OrdersPendingController> {
  final OrdersModel listdata;
  const CardOrderList({Key? key, required this.listdata}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Order Number: #${listdata.ordersId}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  "${listdata.ordersDatetime}",
                  style: const TextStyle(
                      fontSize: 12,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            const Divider(),
            Text("Order Price : ${listdata.ordersPrice} \$"),
            Text("Delivery Price : ${listdata.ordersShippingprice} \$"),
            Text(
                "Payment Method : ${controller.printPaymentMethod(listdata.ordersPaymentmethod!)} "),
            const Divider(),
            Row(
              children: [
                Text(
                  "Total Price: ${listdata.ordersTotal} \$",
                  style: const TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                MaterialButton(
                  onPressed: () {
                    Get.toNamed(AppRoute.shopordersdetails,
                        arguments: {"ordersmodel": listdata});
                  },
                  color: Colors.blue[200],
                  textColor: Colors.blue,
                  child: const Text("Details"),
                ),
                const SizedBox(
                  width: 10,
                ),
                  // MaterialButton(
                  //   onPressed: () {
                  //     controller.approveOrders(
                  //         listdata.ordersUsersid!, listdata.ordersId!);
                  //   },
                  //   color: Colors.blue[200],
                  //   textColor: Colors.blue,
                  //   child: const Text("Approve"),
                  // )
              ],
            )
          ],
        ),
      ),
    );
  }
}
