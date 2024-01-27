import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_porj/controller/productdetail_controller.dart';

import '../../../link_api.dart';

class TopPageProductDetails extends GetView<ProductDetailsControllerImp> {
  const TopPageProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 180,
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(20))),
                ),
                Positioned(
                  top: 30.0,
                  right: Get.width / 8,
                  left: Get.width / 8,
                  child: Hero(
                      tag: "${controller.itemsModel.itemsId}",
                      child: CachedNetworkImage(
                        imageUrl: "${AppLink.imagesitems}/${controller.itemsModel.itemsImage!}",
                        height: 250,
                        fit: BoxFit.fill,
                      )),
                )
              ],
            );
  }
}