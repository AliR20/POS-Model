import 'package:flutter/material.dart';

class AddNewCategoryDialog extends StatelessWidget {
  const AddNewCategoryDialog({Key? key, required this.newController, required this.onPressed}) : super(key: key);
  final TextEditingController newController;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
                        title: Text('Add New Category'),
                        content: TextField(
                          controller: newController,
                        ),
                        actions: [
                          TextButton(
                            onPressed: onPressed,
                            child: Text('Save'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Cancel'),
                          ),
                        ],
                      );
  }
}