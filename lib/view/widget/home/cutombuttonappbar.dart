import 'package:flutter/material.dart';

class CustomButtonAppBar extends StatelessWidget {
  final void Function()? onpressed;
  final String textbutton;
  final IconData icondata;
 
    final bool active ;

   const CustomButtonAppBar(
      {super.key,
      required this.textbutton,
      required this.icondata,
      this.onpressed,
       required this.active});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onpressed,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Icon(
          icondata,
          color: active ==true?Colors.blue:Colors.grey[800],
        ),
        // Text(
        //   textbutton,
        //   style: TextStyle(color: active ==true?Colors.blue:Colors.grey[800]),
        // )
      ]),
    );
  }
}
