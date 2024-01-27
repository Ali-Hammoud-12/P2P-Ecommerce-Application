import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String titleappbar;

  final void Function()? onPressedSearch;
  final void Function()? onPressedIconfavorite;
  final void Function(String)? onChanged;

  final TextEditingController mycontroller;
  const CustomAppBar({
    super.key,
    required this.titleappbar,
    required this.onChanged,
    this.onPressedSearch,
    required this.onPressedIconfavorite, required this.mycontroller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(children: [
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
        const SizedBox(width: 10),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
          width: 60,
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: IconButton(
              onPressed: onPressedIconfavorite,
              color: Colors.blue,
              icon: Icon(
                Icons.favorite_border_outlined,
                size: 30,
                color: Colors.grey[600],
              )),
        )
      ]),
    );
  }
}
