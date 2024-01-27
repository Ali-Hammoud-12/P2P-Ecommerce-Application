import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/shopowner/ordersShop/orderspending.dart';
import '../../controller/shopowner/shopcontroller.dart';
import '../../core/class/handlingdataview.dart';
import 'orderlistcard.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ShopController = Get.put(ShopControllerImp());
    OrdersPendingController controller = Get.put(OrdersPendingController());

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
      body: GetBuilder<OrdersPendingController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: ((context, index) =>
                      CardOrderList(listdata: controller.data[index]))))),
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
