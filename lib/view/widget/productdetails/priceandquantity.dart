import 'package:flutter/material.dart';

class PriceAndQuantity extends StatelessWidget {
  final void Function()? onAdd;
  final void Function()? onRemove;
  final String count, price;

  const PriceAndQuantity(
      {super.key,
      this.onAdd,
      this.onRemove,
      required this.count,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MaterialButton(
            onPressed: onAdd,
            color: Colors.blue,
            padding: const EdgeInsets.all(10),
            child: const Text(
              "Add To Card",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            )),
       
        const Spacer(),
        Text(
          price,
          style: const TextStyle(fontSize: 30, color: Colors.blue),
        ),
      ],
    );
  }
}
