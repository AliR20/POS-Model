import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

enum Categories {
  expense,
  income,
}

class Product {
  final String name, amount, date;
  final String? imageUrl;
  final String category;
  final String description;

  Product( {
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
    };
  }

  // static List<Product> productList = [
  //   Product(
  //       name: 'Rent',
  //       amount: '\$300',
  //       category: Categories.expense,
  //       date: DateFormat.yMMMd().format(DateTime.now())),
  //   Product(
  //       name: 'Sold Items',
  //       amount: '\$1300',
  //       category: Categories.income,
  //       date: DateFormat.yMMMd().format(DateTime.now())),
  //   Product(
  //       name: 'Labour',
  //       amount: '\$500',
  //       category: Categories.expense,
  //       date: DateFormat.yMMMd().format(DateTime.now())),
  // ];
}
