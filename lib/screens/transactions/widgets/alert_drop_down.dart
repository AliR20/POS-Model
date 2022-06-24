import 'package:flutter/material.dart';

class AlertDropDown extends StatelessWidget {
  const AlertDropDown(
      {Key? key,
      required this.items,
      required this.labelText,
      required this.hintText,
      required this.onTap, required this.value})
      : super(key: key);
  final List<String> items;
  final String value;
  final String labelText, hintText;
  final void Function(Object?) onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      foregroundDecoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
      height: 55,
      child: DropdownButtonFormField(
        value: value,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10.0,
            ),
          ),
        ),
        hint: Text(hintText),
        items: items.map((item) {
          return DropdownMenuItem(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onTap,
      ),
    );
  }
}
