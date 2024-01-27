import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:search_choices/search_choices.dart';
import '../../controller/shopowner/viewlistedproductController.dart';
import '../../controller/shopowner/viewproduct.dart';
import '../../core/class/handlingdataview.dart';
import '../../core/constant/routes.dart';
import '../../data/model/itemsmodel.dart';
import '../../link_api.dart';
import '../widget/customshopappbar.dart';

class ListedProductsScreen extends StatelessWidget {
  const ListedProductsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    ViewListedProductControllerImp controller =
        Get.put(ViewListedProductControllerImp());
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(),
        ),
        title: const Text(
          'Listed Products',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue, // set the background color of the AppBar
      ),
      body: GetBuilder<ViewListedProductControllerImp>(
          builder: ((controller) => Column(
                children: [
                  customshopappbar(
                    mycontroller: controller.search!,
                    titleappbar: "Find Product",
                    onPressedSearch: () {
                      controller.onSearchItems();
                    },
                    onChanged: (val) {
                      controller.checkSearch(val);
                    },
                  ),
                  HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: !controller.isSearch
                        ? Expanded(
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: ListView.builder(
                                itemCount: controller.data.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    child: Card(
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 2,
                                              child: CachedNetworkImage(
                                                height: 100,
                                                imageUrl:
                                                    "${AppLink.imagesitems}/${controller.data[index].itemsImage}",
                                              )),
                                          Expanded(
                                            flex: 3,
                                            child: ListTile(
                                              title: Text(
                                                controller
                                                    .data[index].itemsName!,
                                                style: const TextStyle(
                                                    fontSize: 25),
                                              ),
                                              subtitle: Text(
                                                  "Date: ${controller.data[index].itemsDate}\nItem's Quantity: ${controller.data[index].itemsQuantity!}\nItem's Price: ${controller.data[index].itemsPrice!}"),
                                            ),
                                          ),
                                          Expanded(
                                              child: IconButton(
                                            iconSize: 30,
                                            icon: const Icon(
                                                Icons.delete_outline_outlined),
                                            color: Colors.red,
                                            onPressed: () {
                                              Get.defaultDialog(
                                                  title: "Warning",
                                                  middleText:
                                                      "Are you sure you want to remove this item?",
                                                  textConfirm: "Yes",
                                                  textCancel: "No",
                                                  confirmTextColor:
                                                      Colors.white,
                                                  onCancel: () {},
                                                  onConfirm: () {
                                                    controller.deleteItems(
                                                        controller.data[index]
                                                            .itemsId!,
                                                        controller.data[index]
                                                            .itemsImage!);
                                                    Get.offNamed(
                                                        AppRoute.postsScreen);
                                                  });
                                            },
                                          ))
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
                        : Expanded(
                            child: ListItemsSearch(
                                listdatamodel: controller.data)),
                  ),
                ],
              ))),
    );
  }
}

class ListItemsSearch extends GetView<ViewListedProductControllerImp> {
  final List<ItemsModel> listdatamodel;
  const ListItemsSearch({Key? key, required this.listdatamodel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listdatamodel.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            child: Card(
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: CachedNetworkImage(
                        height: 100,
                        imageUrl:
                            "${AppLink.imagesitems}/${controller.data[index].itemsImage}",
                      )),
                  Expanded(
                    flex: 3,
                    child: ListTile(
                      title: Text(
                        controller.data[index].itemsName!,
                        style: const TextStyle(fontSize: 25),
                      ),
                      subtitle: Text(
                          "Date: ${controller.data[index].itemsDate}\nItem's Quantity: ${controller.data[index].itemsQuantity!}\nItem's Price: ${controller.data[index].itemsPrice!}"),
                    ),
                  ),
                  Expanded(
                      child: IconButton(
                    iconSize: 30,
                    icon: const Icon(Icons.delete_outline_outlined),
                    color: Colors.red,
                    onPressed: () {
                      Get.defaultDialog(
                          title: "Warning",
                          middleText:
                              "Are you sure you want to remove this item?",
                          textConfirm: "Yes",
                          textCancel: "No",
                          confirmTextColor: Colors.white,
                          onCancel: () {},
                          onConfirm: () {
                            controller.deleteItems(
                                controller.data[index].itemsId!,
                                controller.data[index].itemsImage!);
                            Get.offNamed(AppRoute.postsScreen);
                          });
                    },
                  ))
                ],
              ),
            ),
          );
        });
  }
}
