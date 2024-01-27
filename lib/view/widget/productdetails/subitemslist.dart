import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_porj/controller/productdetail_controller.dart';

class SubItemsList extends GetView<ProductDetailsControllerImp> {
  const SubItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
                      children: [
                        ...List.generate(
                            controller.subitems.length,
                            (index) => Container(
                                  height: 60,
                                  width: 90,
                                  margin: const EdgeInsets.only(right: 10),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    controller.subitems[index]['name'],
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),

                            )
                      ],
                    );
  }
}