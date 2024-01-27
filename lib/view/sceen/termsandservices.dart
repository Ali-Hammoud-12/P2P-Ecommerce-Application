import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_porj/core/class/handlingdataview.dart';
import 'package:senior_porj/data/model/tasModel.dart';

import '../../controller/termsandservices_controller.dart';

class TermsAndServices extends StatelessWidget {
  const TermsAndServices({super.key});

  @override
  Widget build(BuildContext context) {
    TermsController controller = Get.put(TermsController());
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.blue),
          backgroundColor: Colors.grey[50],
          title: const Text(
            "Terms And Services",
            style: TextStyle(
                color: Colors.blue, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: GetBuilder<TermsController>(
            builder: ((controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.all(20),
                    child: ListView.builder(
                      itemCount: controller.data.length,
                      itemBuilder: (context, int index) {
                        return TermsText(
                            tasModel: (controller.data[index]
                        ));
                      },
                    ),
                  ),
                ))));
  }
}

class TermsText extends GetView<TermsController> {
  final TASModel tasModel;
  const TermsText({super.key, required this.tasModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Text(
        "${tasModel.tAS}",
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }
}
