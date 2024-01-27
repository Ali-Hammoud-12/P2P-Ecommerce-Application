import 'package:flutter/material.dart';

class CardPaymentMethodeCheckout extends StatelessWidget {
  final String title ; 
  final bool isActive ; 
  const CardPaymentMethodeCheckout({super.key, required this.title, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  color:isActive==true? Colors.blue:Color.fromARGB(255, 134, 190, 247), borderRadius: BorderRadius.circular(20)),
              child:  Text(
                title,
                style: const TextStyle(color: Colors.white, height: 1),
              ),
            );
  }
}