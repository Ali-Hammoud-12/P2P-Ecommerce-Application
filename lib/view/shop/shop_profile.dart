import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_porj/core/class/handlingdataview.dart';
import 'package:senior_porj/data/model/usersmodel.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/Profile_controller.dart';
import '../../controller/shopowner/shopcontroller.dart';
import '../../core/constant/routes.dart';

class ShopProfile extends StatelessWidget {
  const ShopProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final ShopController = Get.put(ShopControllerImp());
    ProfileController controller = Get.put(ProfileController());
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
      
      body: GetBuilder<ProfileController>(
      builder: (controller) => HandlingDataView(
        statusRequest: controller.statusRequest,
        widget: ListView(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  height: Get.width / 3,
                  color: Colors.blue,
                ),
                Positioned(
                    top: Get.width / 3.9,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: InkWell(
                        onTap: () {
                          controller.showOptionImage();
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 40,
                          child: ClipOval(
                            child: controller.file != null
                                ? AspectRatio(
                                    aspectRatio: 1,
                                    child: Image.file(
                                      controller.file!,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Icon(Icons.person),
                          ),
                        ),
                      ),
                    )),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: const Text("Address"),
                      trailing: const Icon(Icons.location_on_outlined),
                      onTap: () {
                        Get.toNamed(AppRoute.addressview);
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      title: const Text("Change Password"),
                      trailing: const Icon(Icons.lock_outline),
                      onTap: () {
                        Get.toNamed(AppRoute.changepassword);
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListTile(
                    title: const Text("Contact us"),
                    trailing: const Icon(Icons.mail_outlined),
                    onTap: () {
                      launchUrl(Uri.parse("mailto:alihammoudah12@gmail.com"));
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    title: const Text("Call us"),
                    trailing: const Icon(Icons.phone_outlined),
                    onTap: () {
                      launchUrl(Uri.parse("tel:+961 70734585"));
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    title: const Text("Terms And Services"),
                    trailing: const Icon(Icons.rule_folder_outlined),
                    onTap: () {
                      Get.toNamed(AppRoute.termsandservices);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    title: const Text("Logout"),
                    trailing: const Icon(Icons.logout),
                    onTap: () {
                      controller.logout();
                    },
                  ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),

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
