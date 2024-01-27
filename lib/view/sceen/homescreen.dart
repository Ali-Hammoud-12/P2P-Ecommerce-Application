import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_porj/core/constant/routes.dart';
import 'package:senior_porj/view/widget/home/custombottomappbar.dart';

import '../../controller/homescreen_controller.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Get.toNamed(AppRoute.cart);
                },
                child: const Icon(Icons.shopping_cart_checkout_outlined),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: const CustomBottomAppBarHome(),
              body: WillPopScope(
              child: controller.listPage.elementAt(controller.currentpage,),
              onWillPop: () { Get.defaultDialog(
                title: "Warning",
                middleText: "Do You Want To Close The App",
                onCancel: (){},
                onConfirm: (){exit(0);}

              );return Future.value(false); },)
            
              
            ));
  }
}
