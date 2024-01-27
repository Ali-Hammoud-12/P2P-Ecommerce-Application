import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/shopowner/analytics_controller.dart';
import '../../controller/shopowner/shopcontroller.dart';
import '../../core/class/handlingdataview.dart';
import '../../core/constant/routes.dart';
import '../../link_api.dart';

class AnaltyicsScreen extends StatelessWidget {
  const AnaltyicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ShopController = Get.put(ShopControllerImp());
    AnalyticsControllerImp controller = Get.put(AnalyticsControllerImp());
    void updatePage(int page) {
      if (page == 0) {
        ShopController.post();
      } else if (page == 1) {
        ShopController.analtyics();
      } else if (page == 2) {
        ShopController.orders();
      } else if (page == 3) {
        ShopController.profile();
      }
    }

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(),
        ),
        title: const Text(
          'Shop Owner',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue, // set the background color of the AppBar
        actions: [
          IconButton(
            onPressed: () {
              ShopController.addproducts();
            },
            icon: const Icon(Icons.add),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {
              ShopController.viewlistedproducts();
            },
            icon: const Icon(Icons.archive),
            color: Colors.white,
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<AnalyticsControllerImp>(
            builder: ((controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(children: [
                  const SizedBox(
                    height: 50,
                  ),
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
                                Text("Profit",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold)),
                              ]),
                              const TableRow(children: [
                                SizedBox(
                                  height: 30,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                              ]),
                              ...List.generate(
                                  controller.data.length,
                                  (index) => TableRow(children: [
                                        CachedNetworkImage(
                                          imageUrl:
                                              "${AppLink.imagesitems}/${controller.data[index].itemsImage!}",
                                          height: 70,
                                          width: 110,
                                          fit: BoxFit.fill,
                                        ),
                                        Text(
                                            "${controller.data[index].itemsName}",
                                            textAlign: TextAlign.center),
                                        Text(
                                          "${controller.data[index].total}",
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue),
                                        ),
                                      ]))
                            ],
                          ),
                          const SizedBox(height: 20),
                          ...List.generate(
                            controller.datatotal.length,
                            (index) => Card(
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                    "Total Profit : ${controller.datatotal[index].totalprofit}\$",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ])))),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        currentIndex: ShopController.currentIndex,
        selectedItemColor: Colors.cyan[800]!,
        unselectedItemColor: Colors.black87, // set the background color
        iconSize: 28,
        onTap: updatePage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Posts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_outlined),
            label: 'Analytics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
