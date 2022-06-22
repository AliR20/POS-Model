import 'package:flutter/material.dart';

class AlertTextField extends StatelessWidget {
  const AlertTextField({Key? key, required this.labelText, required this.icon, required this.onTap, required this.controller}) : super(key: key);
   final String labelText;
   final IconData icon;
   final VoidCallback onTap;
   final TextEditingController controller;
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
          suffixIcon: IconButton(
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
