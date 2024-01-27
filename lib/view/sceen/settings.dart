import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_porj/core/constant/routes.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/settings_controller.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return Container(
      child: ListView(
        children: [
          
              Container(
                height: Get.width /2,
                color: Colors.blue,
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
    );
  }
}
