import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_porj/controller/cart_controller.dart';
import 'buttoncart.dart';

class BottomNavgationBarCart extends GetView<CartController> {
  final String price;
  final String shipping;
  final String totalprice;

  const BottomNavgationBarCart({
    Key? key,
    required this.price,
    required this.shipping,
    required this.totalprice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text("price", style: TextStyle(fontSize: 16))),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("$price \$", style: const TextStyle(fontSize: 16)))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text("shipping", style: TextStyle(fontSize: 16))),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("$shipping \$", style: const TextStyle(fontSize: 16)))
          ],
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text("Total Price",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue))),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("$totalprice \$",
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue)))
          ],
        ),
        const SizedBox(height: 10),
        CustomButtonCart(
          textbutton: "Place Order",
          onPressed: () {
            controller.goToCheckout();
          },
        )
      ],
    ));
  }
}
