import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/shopitems_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../core/constant/imageasset.dart';
import '../../data/model/itemsmodel.dart';
import '../../link_api.dart';

class ItemsShop extends StatelessWidget {
  const ItemsShop({super.key});

  @override
  Widget build(BuildContext context) {
    ShopItemsController controller = Get.put(ShopItemsController());
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.blue),
        backgroundColor: Colors.grey[50],
        title: const Text(
          "Shop Product",
          style: TextStyle(
              color: Colors.blue, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(children: [
          GetBuilder<ShopItemsController>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.data.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.7),
                      itemBuilder: (BuildContext context, index) {
                        return CardItemsShop(
                            itemsModel:
                                ItemsModel.fromJson(controller.data[index]));
                      })))
        ]),
      ),
    );
  }
}

class CardItemsShop extends GetView<ShopItemsController> {
  final ItemsModel itemsModel;

  const CardItemsShop({
    Key? key,
    required this.itemsModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          controller.goToPageProductDetails(
            itemsModel,
          );
        },
        child: Card(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Hero(
                        tag: "${itemsModel.itemsId}",
                        child: CachedNetworkImage(
                          imageUrl:
                              "${AppLink.imagesitems}/${itemsModel.itemsImage!}",
                          height: 100,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(itemsModel.itemsName!,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${itemsModel.itemsPriceDiscount} \$",
                              style: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "sans")),
                        ],
                      )
                    ]),
              ),
              if (itemsModel.itemsDiscount != "0")
                Positioned(
                  top: 4,
                  right: 4,
                  child: Image.asset(ImageAsset.sale, width: 40),
                )
            ],
          ),
        ));
  }
}
