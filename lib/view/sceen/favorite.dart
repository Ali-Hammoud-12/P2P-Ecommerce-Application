import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_porj/controller/myfavorite_controller.dart';
import 'package:senior_porj/core/class/handlingdataview.dart';
import '../widget/myfavorite/customlistfavorite.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController());
    return Scaffold(
       appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.blue),
          backgroundColor: Colors.grey[50],
          title: const Text(
            "My Favorite",
            style: TextStyle(
                color: Colors.blue, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0,
        ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GetBuilder<MyFavoriteController>(
            builder: (controller) => ListView(
              children: [
                
                HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.data.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.7),
                      itemBuilder: (context, index) {
                        return CustomListFavoriteItems(
                          itemsModel: controller.data[index],
                        );
                      },
                    ))
              ],
            ),
          )),
    );
  }
}
