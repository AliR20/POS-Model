import 'package:flutter/material.dart';
class AdditionTextField extends StatelessWidget {
  const AdditionTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextField(),
        IconButton(onPressed: (){}, icon: Icon(Icons.add),),
      ],
    );
  }
}