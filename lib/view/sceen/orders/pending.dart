import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_porj/controller/orders/pendingorders_controller.dart';
import 'package:senior_porj/core/class/handlingdataview.dart';
import '../../widget/orders/pendingcardlist.dart';

class PendingOrders extends StatelessWidget {
  const PendingOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PendingOrdersController());
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.blue),
          backgroundColor: Colors.grey[50],
          title: const Text(
            "My Orders",
            style: TextStyle(
                color: Colors.blue, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: GetBuilder<PendingOrdersController>(
                builder: (controller) => HandlingDataRequest(statusRequest: controller.statusRequest, widget: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: ((context, index) =>
                        CardOrdersList(listdata: controller.data[index],)
                        )
                        ))
                        )));
  }
}

