import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_porj/core/class/handlingdataview.dart';

import '../../controller/Profile_controller.dart';
import '../../core/constant/routes.dart';
import '../../link_api.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return GetBuilder<ProfileController>(
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
                        child: const CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 40,
                          child: ClipOval(
                            // child: (controller.datalist.isNotEmpty && controller.datalist[0].usersImage != null)
                            //     ? AspectRatio(
                            //         aspectRatio: 1,
                            //         child: CachedNetworkImage(
                            //           imageUrl:
                            //               "${AppLink.profilepicture}/${controller.datalist[0].usersImage}",
                            //           height: 70,
                            //           width: 110,
                            //           fit: BoxFit.cover,
                            //         ),
                            //       )
                            //     : Icon(Icons.person),
                            child: AspectRatio(
                                    aspectRatio: 1,
                                    child: Icon(Icons.person)
                                  )
                          ),
                        ),
                      ),
                    )),
              ],
            ),
            const SizedBox(
              height: 200,
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
                      title: const Text("My Orders"),
                      trailing: const Icon(Icons.card_travel_outlined),
                      onTap: () {
                        Get.toNamed(AppRoute.pendingorders);
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      title: const Text("Buy Again"),
                      trailing: const Icon(Icons.card_giftcard_sharp),
                      onTap: () {
                        Get.toNamed(AppRoute.buyagain);
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
