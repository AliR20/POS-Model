import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pos_model/screens/customers/models/customer.dart';

import '../models/products.dart';

Future<Uint8List> getImageFromGallery(Uint8List images) async {
  final imagePicker = ImagePicker();
  final imagePicked = await imagePicker.pickImage(source: ImageSource.gallery);
  final imageFile = await imagePicked!.readAsBytes();
  images = imageFile;
  return images;
}

Future<Uint8List> getWebFile(Uint8List webImage) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();
  Uint8List? file = result?.files.single.bytes!;
  return file!;
}

Future productsSaving(
  BuildContext context,
  String amount,
  String category,
  String date,
  String name,
  String description,
  List categoriesList,
) async {
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
          amount: amount,
          category: category.toUpperCase(),
          date: date,
          name: name,
          description: description.isEmpty ? '' : description,
          categoriesList: categoriesList,
          imageUrl: imageUrl == null ? '' : imageUrl,
        ).toMap(),
      );
  Navigator.of(context).pop();
}

Future addingCustomer(
  {
    required BuildContext context,
    required String name,
    required String bio,
    required String type,
    required String location,
    required String phoneNumber,
    required String paymentType,
required String date,
required String openingBalance,
required String shippingAddress,
required String creditLimit,
required String discountPercentage,
  }
) async {
  final imageUrl = await FirebaseStorage.instance
      .ref()
      .child('Customers')
      .child(FirebaseAuth.instance.currentUser!.uid)
      .getDownloadURL();
  await FirebaseFirestore.instance
      .collection('customers')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('userCustomers')
      .doc()
      .set(Customer(
          name: name,
          imageUrl: imageUrl == null? '': imageUrl,
          type: type,
          location: location,
          phoneNumber: phoneNumber,
          paymentType: paymentType,
          openingBalance: openingBalance,
          date: date,
          creditLimit: creditLimit,
          shippingAddress: shippingAddress,
          discountPercentage: discountPercentage,
          bio: bio).toMap());
  Navigator.of(context).pop();
}
