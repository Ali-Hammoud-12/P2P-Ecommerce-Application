import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_porj/controller/productdetail_controller.dart';
import 'package:senior_porj/core/class/handlingdataview.dart';
import 'package:senior_porj/data/model/itemsmodel.dart';
import '../../core/constant/routes.dart';
import '../../data/model/ratingmodel.dart';
import '../widget/items/itemsrating.dart';
import '../widget/productdetails/priceandquantity.dart';
import '../widget/productdetails/toppageproductdetail.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller =
        Get.put(ProductDetailsControllerImp());
    return Scaffold(
      bottomNavigationBar: Container(
          margin: const EdgeInsets.all(10),
          height: 40,
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.blue,
            onPressed: () {
              Get.toNamed(AppRoute.cart);
            },
            child: const Text(
              "GO TO CART",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )),
      body: GetBuilder<ProductDetailsControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            child: ListView(
              children: [
                const TopPageProductDetails(),
                const SizedBox(
                  height: 100,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${controller.itemsModel.itemsName}",
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(color: Colors.blue)),
                        const SizedBox(
                          height: 10,
                        ),
                        PriceAndQuantity(
                          count: "${controller.countitems}",
                          price:
                              "${controller.itemsModel.itemsPriceDiscount} \$",
                          onAdd: () {
                            controller.add();
                          },
                          onRemove: () {
                            controller.remove();
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        MaterialButton(
                          onPressed: () {
                            controller.goToItemsShop(controller.itemsModel);
                          },
                          child: Text(
                            "Shop: ${controller.itemsModel.usersName!}",
                            style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        Text(
                            "${controller.itemsModel.itemsDescription}",
                            style: Theme.of(context).textTheme.bodyText1!),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        MaterialButton(
                            onPressed: () {
                              showDialogRating(
                                  context,
                                  controller.itemsModel.itemsId!);
                            },
                            color: Colors.blue,
                            padding: const EdgeInsets.all(10),
                            child: const Text(
                              "Rate This Product",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                        SizedBox(
                          height: 200,
                          child: SingleChildScrollView(
                            child: SizedBox(
                              height: 200,
                              child: ListView.builder(
                                itemCount: controller.data.length,
                                itemBuilder: (context, i) {
                                  return CardRate(
                                    ratingModel: controller.data[i],
                                  );
                                },
                              ),
                            ),
                          ),
                        )
                      ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardRate extends StatelessWidget {
  final RatingModel ratingModel;
  const CardRate({
    Key? key,
    required this.ratingModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: ListTile(
          title: Text(ratingModel.ratingNote!),
          subtitle: Text(
            "${ratingModel.usersName}",
            style: const TextStyle(color: Colors.black),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(ratingModel.ratingRate!),
              const Icon(
                Icons.star_outline,
                color: Colors.yellow,
              )
            ],
          ),
        ));
  }
}
