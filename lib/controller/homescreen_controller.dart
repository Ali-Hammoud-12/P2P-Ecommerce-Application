import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_porj/data/datasource/remote/favoritedata.dart';
import 'package:senior_porj/view/sceen/favorite.dart';
import 'package:senior_porj/view/sceen/home.dart';
import 'package:senior_porj/view/sceen/settings.dart';

import '../view/sceen/notification.dart';
import '../view/sceen/profile.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentPage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;
  
  List<Widget> listPage = [
    const HomePage(),
    const NotificationPage(),
   const Profile(),
    const Settings(),
    
  ];
  List bottomappbar = [
    {"title": "home", "icon": Icons.home},
    {"title": "My Favorite", "icon": Icons.notifications_active_outlined},
    {"title": "profile", "icon": Icons.person_pin_sharp},
    {"title": "settings", "icon": Icons.settings}
  ];
    

  @override
  changePage(int currentPage) {
    currentpage = currentPage;
    update();
  }
}
