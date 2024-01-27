import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_porj/controller/cart_controller.dart';
import 'package:senior_porj/core/class/handlingdataview.dart';
import '../widget/cart/appbarcart.dart';
import '../widget/cart/custombuttonnavigationbar_cart.dart';
import '../widget/cart/customitemscartlist.dart';
import '../widget/cart/topcardcart.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.blue),
          backgroundColor: Colors.grey[50],
          title: const Text(
            "My Cart",
            style: TextStyle(
                color: Colors.blue, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        bottomNavigationBar: GetBuilder<CartController>(
            builder: (controller) => BottomNavgationBarCart(
                price: "${cartController.priceorders}",
                shipping: "${controller.shippingprice}",
                totalprice: "${controller.total}")),
        body: GetBuilder<CartController>(
            builder: ((controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(
                  children: [
                    const SizedBox(height: 10),
                    TopCardCart(
                        message:
                            "You Have ${cartController.totalcountitems} Items in Your List"),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ...List.generate(
                            cartController.data.length,
                            (index) => CustomItemsCartList(
                                onAdd: () async {
                                  await cartController
                                      .add(cartController.data[index].itemsId!);
                                  cartController.refreshPage();
                                },
                                onRemove: () async {
                                  await cartController.delete(
                                      cartController.data[index].itemsId!);
                                  cartController.refreshPage();
                                },
                                imagename:
                                    "${cartController.data[index].itemsImage}",
                                name: "${cartController.data[index].itemsName}",
                                price:
                                    "${cartController.data[index].itemsprice} \$",
                                count:
                                    "${cartController.data[index].countitems}"),
                          )
                        ],
                      ),
                    )
                  ],
                )))));
  }
}
