import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_porj/controller/checkout_controller.dart';
import 'package:senior_porj/core/class/handlingdataview.dart';
import 'package:senior_porj/view/widget/checkout/cardshippingaddress.dart';
import 'package:senior_porj/view/widget/checkout/cartpaymentmethod.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.blue),
          backgroundColor: Colors.grey[50],
          title: const Text(
            "Checkout",
            style: TextStyle(
                color: Colors.blue, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(10),
          child: MaterialButton(
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {
              controller.checkout();
            },
            child: const Text(
              "Checkout",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ),
        body: GetBuilder<CheckoutController>(
            builder: (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding: const EdgeInsets.all(20),
                  child: ListView(
                    children: [
                      const SizedBox(height: 50),
                      const Text(
                        "Choose Payment Methode",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                          onTap: () {
                            controller.choosePaymentMethod("0"); //1 pay cash
                          },
                          child: CardPaymentMethodeCheckout(
                              title: "Cash On Delivery",
                              isActive: controller.paymentMethod == "0"
                                  ? true
                                  : false)),
                      InkWell(
                          onTap: () {
                            controller
                                .choosePaymentMethod("1"); //1 pay with card
                          },
                          child: CardPaymentMethodeCheckout(
                              title: "Payment Card",
                              isActive: controller.paymentMethod ==
                                      "1" //1 pay with card
                                  ? true
                                  : false)),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Shipping Address",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ...List.generate(
                        controller.dataaddress.length,
                        (index) => InkWell(
                          onTap: () {
                            controller.chooseShippingAddress(
                                controller.dataaddress[index].addressId!);
                          },
                          child: CardShippingAddressCheckout(
                              title:
                                  "${controller.dataaddress[index].addressCountry}",
                              body:
                                  "${controller.dataaddress[index].addressCity} ${controller.dataaddress[index].addressStreet}",
                              isActive: controller.addressid ==
                                      controller.dataaddress[index].addressId
                                  ? true
                                  : false),
                        ),
                      ),
                      if(controller.data.isNotEmpty)const SizedBox(height: 50),
                      if(controller.data.isNotEmpty)const Text(
                        "Choose Carrier",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      ...List.generate(
                        controller.data.length,
                        (index) => InkWell(
                            onTap: () {
                              controller.chooseCarrier("${controller.data[index].carrierId}"); //1 pay cash
                            },
                            child: CardPaymentMethodeCheckout(
                                title: "${controller.data[index].carrierName}",
                                isActive: controller.carriername == "${controller.data[index].carrierId}"
                                    ? true
                                    : false)),
                      )
                    ],
                  ),
                ))));
  }
}
