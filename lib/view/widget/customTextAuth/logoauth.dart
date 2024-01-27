import 'package:flutter/material.dart';
import 'package:senior_porj/core/constant/imageasset.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(ImageAsset.logoAuth,height: 170,);
  }
}
