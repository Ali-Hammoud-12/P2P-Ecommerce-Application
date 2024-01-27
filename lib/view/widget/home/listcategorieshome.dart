import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_porj/controller/home_controller.dart';
import 'package:senior_porj/data/model/categoriesmodel.dart';
import '../../../link_api.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {
  const ListCategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
              i: index,
              categoriesModel:
                  CategoriesModel.fromJson(controller.categories[index]));
        },
      ),
    );
  }
}

class Categories extends GetView<HomeControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;
  const Categories({
    super.key,
    required this.categoriesModel,
    required this.i,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(controller.categories, i!,categoriesModel.categoriesId!);
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 70,
            width: 70,
            child: CachedNetworkImage(imageUrl: 
              "${AppLink.imagescategories}/${categoriesModel.categoriesImage}",
            ),
          ),
          Text(
            "${categoriesModel.categoriesName}",
            style: const TextStyle(fontSize: 13, color: Colors.black),
          )
        ],
      ),
    );
  }
}
