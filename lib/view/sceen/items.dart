import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_porj/controller/favorite_controller.dart';
import 'package:senior_porj/controller/items_controller.dart';
import 'package:senior_porj/core/class/handlingdataview.dart';
import 'package:senior_porj/data/model/itemsmodel.dart';
import '../../core/constant/routes.dart';
import '../widget/customappbar.dart';
import '../widget/items/customlistitems.dart';
import '../widget/items/listcategoriesitems.dart';
import 'home.dart';
class Items extends StatelessWidget {
  const Items({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(children: [
          CustomAppBar(
            mycontroller: controller.search!,
            titleappbar: "Find Product",
           
            onPressedSearch: () {
              controller.onSearchItems();
            },
            onChanged: (val) {
              controller.checkSearch(val);
            },
            onPressedIconfavorite: () {
              Get.toNamed(AppRoute.myfavorite);
            },
            
          ),
          const SizedBox(height: 20),
          const ListCategoriesItems(),
          GetBuilder<ItemsControllerImp>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: !controller.isSearch
                      ? GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.data.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 0.7),
                          itemBuilder: (BuildContext context, index) {
                            controllerFav.isFavorite[controller.data[index]
                                    ['items_id']] =
                                controller.data[index]['favorite'];
                            return CustomListItems(
                                itemsModel: ItemsModel.fromJson(
                                    controller.data[index]));
                          })
                      : ListItemsSearch(listdatamodel: controller.listdata)))
        ]),
      ),
    );
  }
}


