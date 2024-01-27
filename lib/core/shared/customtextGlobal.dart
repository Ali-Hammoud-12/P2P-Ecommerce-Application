import 'package:flutter/material.dart';

class CustomTextGlobal extends StatelessWidget {
  final String labeltext;
  final TextEditingController mycontroller;
  final String? Function(String?) valid;
  final bool isNumber;
  final bool? obsecureText;
  final void Function()? onTapIcon;

  const CustomTextGlobal(
      {super.key,
      required this.labeltext,
      required this.mycontroller,
      required this.valid,
      required this.isNumber,
      this.obsecureText,
      this.onTapIcon, });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.white),
      child: TextFormField(
        obscureText: obsecureText == null || obsecureText== false ? false : true,
        keyboardType: isNumber ? TextInputType.phone : TextInputType.text,
        validator: valid,
        controller: mycontroller,
        decoration: InputDecoration(
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 9),
                child: Text(
                  labeltext,
                )),
           
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 30)),
      ),
    );
  }
}
