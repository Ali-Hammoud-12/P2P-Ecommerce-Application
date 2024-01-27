import 'package:flutter/material.dart';

class CustomCardHome extends StatelessWidget {
  final String title;
  final String body;
  const CustomCardHome({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Stack(children: [
        Container(
          alignment: Alignment.center,
          height: 150,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(20)),
          child:  ListTile(
            title: Text(title,
                style: TextStyle(color: Colors.white, fontSize: 20)),
            subtitle: Text(body,
                style: TextStyle(color: Colors.white, fontSize: 30)),
          ),
        ),
        Positioned(
          top: -20,
          right: -20,
          child: Container(
            height: 160,
            width: 160,
            decoration: BoxDecoration(
                color: Colors.blue[600],
                borderRadius: BorderRadius.circular(160)),
          ),
        )
      ]),
    );
  }
}
