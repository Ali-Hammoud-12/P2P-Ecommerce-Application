import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:senior_porj/core/constant/routes.dart';

import '../../../controller/orders/pendingorders_controller.dart';
import '../../../data/model/ordermodel.dart';

class CardOrdersList extends GetView<PendingOrdersController> {
  final OrdersModel listdata;
  const CardOrdersList({super.key, required this.listdata});

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
                  "Order number # ${listdata.ordersId}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  Jiffy(listdata.ordersDatetime!, "yyy-MM-dd").fromNow(),
                  style: const TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const Divider(),
            Text("Order Price:${listdata.ordersPrice} \$"),
            Text("Shipping Price:${listdata.ordersShippingprice} \$"),
            Text(
                "Payment Method : ${controller.printPaymentMethod(listdata.ordersPaymentmethod!)}"),
            Text(
                "Orders Status : ${controller.printOrderStatus(listdata.ordersStatus!)}"),
            const Divider(),
            Row(
              children: [
                Text(
                  "Total Price : ${listdata.ordersTotal} \$",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue),
                ),
                const Spacer(),
                MaterialButton(color: Colors.blue,
                  onPressed: () {
                    Get.toNamed(AppRoute.orderdetails,arguments: {
                      "ordersmodel":listdata
                    });
                  },
                  child: const Text("Details",style: TextStyle(color: Colors.white),),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
