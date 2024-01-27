import 'package:flutter/material.dart';

class CustomTextSignUpAndSignIn extends StatelessWidget {
  final String textone;
  final String texttwo;
  final void Function()? onTap;
  const CustomTextSignUpAndSignIn(
      {super.key, required this.textone, required this.texttwo, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textone),
        InkWell(
          onTap: onTap,
          child: Text(
            texttwo,
            style: const TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
