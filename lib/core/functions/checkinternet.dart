import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../constant/imageasset.dart';

checkInternet() async {
  try {
    var result = await InternetAddress.lookup("google.com");
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  }on SocketException catch (_) {
    return Center(
                child: Lottie.asset(ImageAsset.offline,
                    width: 250, height: 250))
                    ;
  }
}