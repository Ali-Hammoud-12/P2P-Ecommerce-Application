import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:search_choices/search_choices.dart';
import '../../controller/shopowner/shopcontroller.dart';
import '../../controller/shopowner/viewproduct.dart';
import '../../core/class/handlingdataview.dart';
import '../../core/constant/routes.dart';
import '../../data/model/itemsmodel.dart';
import '../../link_api.dart';
import '../widget/customshopappbar.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ShopController = Get.put(ShopControllerImp());
    ViewProductControllerImp controller = Get.put(ViewProductControllerImp());

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
      body: GetBuilder<ViewProductControllerImp>(
          builder: ((controller) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: customshopappbar(
                      mycontroller: controller.search!,
                      titleappbar: "Find Product",
                      onPressedSearch: () {
                        controller.onSearchItems();
                      },
                      onChanged: (val) {
                        controller.checkSearch(val);
                      },
                    ),
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
                                    onTap: () {
                                      controller
                                          .goTopageEdit(controller.data[index]);
                                    },
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
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            //=================================================else
                          )
                        : Expanded(
                            child: ListItemsSearch(
                                listdatamodel: controller.data)),
                  ),
                ],
              ))),
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

class ListItemsSearch extends GetView<ViewProductControllerImp> {
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
            onTap: () {
              controller.goTopageEdit(controller.data[index]);
            },
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
                ],
              ),
            ),
          );
        });
  }
}
