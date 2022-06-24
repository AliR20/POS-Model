import 'dart:io';
import 'dart:typed_data';

import 'package:awesome_calendar/awesome_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pos_model/screens/login/services/firebase_services.dart';
import 'package:pos_model/screens/transactions/models/products.dart';
import 'package:pos_model/screens/transactions/widgets/alert_drop_down.dart';
import 'package:pos_model/screens/transactions/widgets/alert_text_field.dart';
import 'package:pos_model/screens/transactions/widgets/upload_product_container.dart';
import 'package:pos_model/utils/date_formatter.dart';

import '../../../utils/responsive.dart';

class IncomeView extends StatefulWidget {
  const IncomeView({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<IncomeView> createState() => _IncomeViewState();
}

class _IncomeViewState extends State<IncomeView> {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController newController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  Uint8List? images;
  File? webImage;
  String? category;
  String? paymentMethod;
  @override
  void initState() {
    dateController.text = DateFormatter.formateDate(DateTime.now()).toString();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    dateController.dispose();
    amountController.dispose();
    descriptionController.dispose();
    newController.dispose();
    nameController.dispose();
  }

  List<String> incomeCategories = [
    'Income',
    'Add New',

  ];
  List<String> expensesCategories = ['Expense', 'Add New'];
  List<String> paymentMethods = [
    'Cash',
    'Credit',
    'Partial',
  ];
  String webImages = '';
  String mobileImage = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AlertTextField(
          
          isCustomer: false,
          labelText: 'Date',
          controller: dateController,
          icon: Icons.calendar_today,
          onTap: () async {
            final List<DateTime>? picked = await showDialog<List<DateTime>>(
              context: context,
              builder: (BuildContext context) {
                return const AwesomeCalendarDialog(
                  selectionMode: SelectionMode.multi,
                  canToggleRangeSelection: true,
                );
              },
            );
            final formattedDate = DateFormatter.formateDate(picked!.first);
            setState(() {
              dateController.text = formattedDate;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: AlertTextField(
           
            isCustomer: false,
            labelText: 'Name',
            controller: nameController,
            icon: Icons.border_all_outlined,
            onTap: () {},
          ),
        ),
        AlertDropDown(
          value: widget.index == 0 ? 'Income' : 'Expense',
          items: widget.index == 0 ? incomeCategories : expensesCategories,
          labelText: widget.index == 0 ? 'Income' : 'Expense',
          hintText: 'Select the Category',
          onTap: (newValue) {
            setState(() {
              category = newValue.toString();
            });
            if (newValue == 'Add New') {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Text('Add New Category'),
                        content: TextField(
                          controller: newController,
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                category = newController.text;
                              widget.index == 0? incomeCategories.add(category!): expensesCategories.add(category!);
                              });
                              newController.clear();
                              Navigator.of(context).pop();
                            },
                            child: Text('Save'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Cancel'),
                          ),
                        ],
                      ));
            }
          },
        ),
        AlertDropDown(
          value: 'Cash',
          items: paymentMethods,
          labelText: 'Payment Method',
          hintText: paymentMethods[0],
          onTap: (newValue) {
            setState(() {
              paymentMethod = newValue.toString();
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: AlertTextField(
            isCustomer: false,
         
            labelText: 'Amount',
            controller: amountController,
            icon: Icons.attach_money_sharp,
            onTap: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: TextField(
            maxLines: 4,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
              ),
              labelText: 'Description (optional)',
            ),
            controller: descriptionController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: UploadProductContainer(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: SizedBox(
            height: 50,
            width: 200,
            child: ElevatedButton.icon(
              onPressed: () async {
                final imageUrl = await FirebaseStorage.instance
                    .ref()
                    .child('Products')
                    .child(FirebaseAuth.instance.currentUser!.uid)
                    .getDownloadURL();
                await FirebaseFirestore.instance
                    .collection('products')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .collection('userProducts')
                    .doc()
                    .set(
                      Product(
                        amount: amountController.text,
                        category: category!.toUpperCase(),
                        date: dateController.text,
                        name: nameController.text,
                        description: descriptionController.text.isEmpty? '': descriptionController.text,
                       categoriesList: widget.index == 0? incomeCategories: expensesCategories,
                        imageUrl: imageUrl == null? '': imageUrl,
                      ).toMap(),
                    );
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.save,
                color: Colors.white,
              ),
              label: Text(
                "Save",
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
