import 'package:flutter/material.dart';

class customshopappbar extends StatelessWidget {
  final String titleappbar;

  final void Function()? onPressedSearch;
  final void Function(String)? onChanged;

  final TextEditingController mycontroller;
  const customshopappbar({
    super.key,
    required this.titleappbar,
    required this.onChanged,
    this.onPressedSearch,
    required this.mycontroller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(top: 5),
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
            controller: mycontroller,
            onChanged: onChanged,
            decoration: InputDecoration(
                prefixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: onPressedSearch,
                ),
                hintText: titleappbar,
                hintStyle: const TextStyle(fontSize: 18),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: Colors.grey[200]),
          )),
        ],
      ),
    );
  }
}
