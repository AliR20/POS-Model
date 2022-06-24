import 'package:flutter/material.dart';

class AlertTextField extends StatelessWidget {
  const AlertTextField({Key? key, required this.labelText,this.icon, this.onTap, required this.controller, required this.isCustomer,}) : super(key: key);
   final String labelText;
   final IconData? icon;
   final VoidCallback? onTap;
   final TextEditingController controller;
   final bool isCustomer;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10.0,
            ),
          ),
          labelText: labelText,
          suffixIcon: isCustomer ? null :IconButton(
            onPressed: onTap,
            icon: Icon(
              icon
            ),
          ),
        ),
      ),
    );
  }
}
