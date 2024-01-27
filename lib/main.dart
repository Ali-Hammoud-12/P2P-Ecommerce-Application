import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_porj/core/functions/checkinternet.dart';
import 'package:senior_porj/core/services/services.dart';
import 'package:senior_porj/initialbinding.dart';


import 'core/localization/changelocal.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  await checkInternet();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
          headline2: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 26, color: Colors.black),
          bodyText1: TextStyle(
              height: 2,
              fontStyle: FontStyle.italic,
              fontSize: 17,
              color: Colors.black),
          bodyText2: TextStyle(fontSize: 14, color: Colors.black),
        ),
        primarySwatch: Colors.blue,
      ),
      getPages: routes,
      initialBinding: InitialBindings(),
    );
  }
}
