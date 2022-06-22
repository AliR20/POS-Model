import 'package:flutter/material.dart';

void otpDialog(
 { required BuildContext context,
  required VoidCallback onPressed,
  required TextEditingController controller,

 }
){
  showDialog(
  context: context,
  barrierDismissible: false,
   builder: (context) => AlertDialog(
    title: Text('Enter OTP'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(controller: controller),
      ],
    ),
    actions: [
      TextButton(onPressed: onPressed, child: Text('Done'),),
    ],
   )
    );
}
