import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';


class CustomDropDownSearch extends StatefulWidget {
  final String? title;
  final List<SelectedListItem> listdata;
  final TextEditingController dropdownSelecredName;
  final TextEditingController dropdownSelecredId;

  const CustomDropDownSearch(
      {super.key,
      this.title,
      required this.listdata,
      required this.dropdownSelecredName,
      required this.dropdownSelecredId});
  @override
  State<CustomDropDownSearch> createState() => _CustomDropDownSearchState();
}

class _CustomDropDownSearchState extends State<CustomDropDownSearch> {
  void showDropDownSearch() {
    DropDownState(
      DropDown(
          isDismissible: true,
          bottomSheetTitle: Text(
            widget.title!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          submitButtonChild: const Text(
            'Done',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          data: widget.listdata,
          selectedItems: (List<dynamic> selectedList) {
            //The one choosen is at index 0
            SelectedListItem selectedListItem = selectedList[0];
            widget.dropdownSelecredName.text = selectedListItem.name;
            widget.dropdownSelecredId.text = selectedListItem.value!;
          }
          // enableMultipleSelection: true,
          ),
    ).showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.dropdownSelecredName,
      cursorColor: Colors.black,
      onTap: () {
        FocusScope.of(context).unfocus();
        showDropDownSearch();
      },
      decoration: InputDecoration(
        label: Container(
          margin: const EdgeInsets.symmetric(horizontal: 9),
          child: Text(widget.dropdownSelecredName.text == ""
              ? widget.title!
              : widget.title!, textAlign: TextAlign.center,),
        ),
        suffixIcon: const InkWell(
          child: Icon(Icons.arrow_drop_down),
        ),
        filled: false,
        fillColor: Colors.black12,
        contentPadding:
            const EdgeInsets.only(left: 8, bottom: 0, top: 0, right: 15),
        hintText: widget.dropdownSelecredName.text == ""
            ? widget.title
            : widget.dropdownSelecredName.text,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.solid,
            color: Colors.black,
            
          ),
          // borderRadius: BorderRadius.all(
          //   Radius.circular(8.0),
          // ),
        ),
      ),
    );
  }
}
