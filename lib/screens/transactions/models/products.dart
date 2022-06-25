import 'package:cloud_firestore/cloud_firestore.dart';

enum Categories {
  expense,
  income,
}

class Product {
  final String name, amount, date;
  final String? imageUrl;
  final String category,description;
  final List categoriesList;

  Product( {
   required  this.categoriesList, 
   required  this.description,
    required this.name,
    required this.amount,
    required this.category,
    required this.date,
    this.imageUrl,
  });
  factory Product.fromDocs(QueryDocumentSnapshot snapshot) {
    return Product(
      amount: snapshot.get('amount'),
      category: snapshot.get('category'),
      date: snapshot.get('date'),
      name: snapshot.get('name'),
      imageUrl: snapshot.get('imageUrl'),
      description: snapshot.get('description'),
      categoriesList: snapshot.get('categoriesList'),
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'category': category,
      'date': date,
      'name': name,
      'imageUrl': imageUrl ?? '',
      'description': description,
      'categoriesList': categoriesList,
    };
  }
}
