import 'package:flutter/material.dart';

class CustomButtonAuth extends StatelessWidget {
  final String text;
  final void Function()? onpressed;
  const CustomButtonAuth({super.key, required this.text, this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.all(13),
        onPressed: onpressed,
        color: Colors.blue,
        textColor: Colors.white,
        child: Text(text),
      ),
    );
  }
}
