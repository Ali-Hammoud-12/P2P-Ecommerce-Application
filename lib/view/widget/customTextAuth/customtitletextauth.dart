import 'package:flutter/material.dart';

class CusstomTitleTextAuth extends StatelessWidget {
  final String titleText;
  const CusstomTitleTextAuth({super.key, required this.titleText});

  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline2!,
    );
  }
}
