
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_porj/view/sceen/profile.dart';
import 'package:senior_porj/view/shop/post_screen.dart';
import 'package:senior_porj/view/shop/shop_profile.dart';

import '../../controller/shopowner/shopcontroller.dart';
import 'analyticsSreen.dart';
import 'orders_screen.dart';

class ShopownerScreen extends StatelessWidget {
  const ShopownerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ShopControllerImp());
    final pages = [const PostsScreen(), const AnaltyicsScreen(), const OrderScreen(), const Profile()];

    void updatePage(int page) {
      if (page == 0) {
        controller.post();
      } else if (page == 1) {
        controller.analtyics();
      } else if (page == 2) {
        controller.orders();
      } else if (page == 3) {
        controller.profile();
      }
    }
    return Scaffold(
      // appBar: AppBar(
      //   flexibleSpace: Container(
      //     decoration: const BoxDecoration(),
      //   ),
      //   title: const Text(
      //     'Shop Owner',
      //     style: TextStyle(
      //       color: Colors.white,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      //   backgroundColor: Colors.blue, // set the background color of the AppBar
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         controller.addproducts();
      //         updatePage(3);
      //       },
      //       icon: const Icon(Icons.add),
      //       color: Colors.white,
      //     ),
      //     IconButton(
      //       onPressed: () {},
      //       icon: const Icon(Icons.notifications),
      //       color: Colors.white,
      //     ),
      //     IconButton(
      //       onPressed: () {},
      //       icon: const Icon(Icons.settings),
      //       color: Colors.white,
      //     ),
      //   ],
      // ),
      body: pages[controller.currentIndex],
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Colors.blue,
      //   currentIndex: controller.currentIndex,
      //   selectedItemColor: Colors.cyan[800]!,
      //   unselectedItemColor: Colors.black87,// set the background color 
      //   iconSize: 28,
      //   onTap: updatePage,
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.shopping_bag_outlined),
      //       label: 'Posts',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.bar_chart_outlined),
      //       label: 'Analytics',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.shopping_cart_outlined),
      //       label: 'Orders',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.account_circle_outlined),
      //       label: 'Profile',
      //     ),
      //   ],
      // ),
    );
  }
}
