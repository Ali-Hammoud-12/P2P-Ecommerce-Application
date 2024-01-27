import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_porj/controller/favorite_controller.dart';
import 'package:senior_porj/controller/items_controller.dart';
import 'package:senior_porj/core/constant/imageasset.dart';
import 'package:senior_porj/data/model/itemsmodel.dart';

import '../../../link_api.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;

  const CustomListItems({
    Key? key,
    required this.itemsModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          controller.goToPageProductDetails(itemsModel,);
        },
        child: Card(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
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
                     const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          
                         
                          Text("${itemsModel.itemsPriceDiscount} \$",
                              style: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "sans")),
                                   
                                  
                          GetBuilder<FavoriteController>(
                            builder: (controller) => IconButton(
                                onPressed: () {
                                  if (controller.isFavorite[itemsModel.itemsId] ==
                                      "1") {
                                    controller.setFavorite(itemsModel.itemsId, "0");
                                    controller.removeFavorite(itemsModel.itemsId!);
                                  } else {
                                    controller.setFavorite(itemsModel.itemsId, "1");
                                    controller.addFavorite(itemsModel.itemsId!);
                                  }
                                },
                                icon: Icon(
                                  controller.isFavorite[itemsModel.itemsId] == "1"
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined,
                                  color: Colors.blue,
                                )),
                          )
                        ],
                      ),
                     if(itemsModel.itemsDiscount!= "0") Row(mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("${itemsModel.itemsPrice} \$",
                      textAlign: TextAlign.start,
                                style: const TextStyle(
                                  
                                    color: Colors.red,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.lineThrough,decorationColor: Colors.black,
                                    
                                    fontFamily: "sans")),
                        ],
                      )
                    ]),
              ),
              if(itemsModel.itemsDiscount!= "0")
              Positioned(
                top: 4,
                right: 4,

                child:Image.asset(ImageAsset.sale,width: 40), )
            ],
          ),
        ));
  }
}
