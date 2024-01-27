import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_porj/view/widget/customTextAuth/customtextformauth.dart';
import '../../../controller/address/addressdetails_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/customTextAuth/custombuttonauth.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddAddressDetailsController controller =
        Get.put(AddAddressDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('add details address'),
      ),
      body: Container(
          padding: const EdgeInsets.all(15),
          child: GetBuilder<AddAddressDetailsController>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Text("Choose Your Country :"),
                  Obx(() => Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: DropdownButton(
                          icon: const Icon(Icons.flag_outlined),
                          isExpanded: true,
                          underline: const Divider(
                            thickness: 0.0,
                          ),
                          hint: const Text(
                            'Choose Your Country',
                          ),
                          onChanged: (newValue) {
                            controller.setSelected(newValue!);
                          },
                          value: controller.country.value,
                          items: controller.listType.map((selectedType) {
                            return DropdownMenuItem(
                              child: new Text(
                                selectedType,
                              ),
                              value: selectedType,
                            );
                          }).toList(),
                        ),
                      )),
                  CustomTextFormAuth(
                      labeltext: "City",
                      inconData: Icons.location_city,
                      mycontroller: controller.city,
                      valid: (val) {
                        return ValidInput(val!, 1, 50, "desc");
                      },
                      isNumber: false),
                  CustomTextFormAuth(
                      labeltext: "Street",
                      inconData: Icons.streetview,
                      mycontroller: controller.street,
                      valid: (val) {
                        return ValidInput(val!, 1, 50, "desc");
                      },
                      isNumber: false),
                  CustomTextFormAuth(
                      labeltext: "Building",
                      inconData: Icons.near_me,
                      mycontroller: controller.name,
                      valid: (val) {},
                      isNumber: false),
                  CustomButtonAuth(
                    text: "Add",
                    onpressed: () {
                      controller.addAddress();
                    },
                  )
                ])),
          )),
    );
  }
}
