import 'package:flutter/material.dart';

class CardShippingAddressCheckout extends StatelessWidget {
  final String title;
  final String body;

  final bool isActive;
  const CardShippingAddressCheckout({super.key, required this.title, required this.body, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isActive==true?Colors.blue:Color.fromARGB(255, 134, 190, 247),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child:  ListTile(
        title: Text(
          title,
          style:const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          body,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
