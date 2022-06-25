import 'package:cloud_firestore/cloud_firestore.dart';

class Customer {
  final String name,
      imageUrl,
      type,
      location,
      phoneNumber,
      paymentType,
      openingBalance,
      date,
      creditLimit,
      shippingAddress,
      discountPercentage,
      bio;

  Customer(
      {required this.name,
      required this.imageUrl,
      required this.type,
      required this.location,
      required this.phoneNumber,
      required this.paymentType,
      required this.openingBalance,
      required this.date,
      required this.creditLimit,
      required this.shippingAddress,
      required this.discountPercentage,
      required this.bio,
      }
      );
      factory Customer.fromDocs(QueryDocumentSnapshot snapshot){
        return Customer(
        bio: snapshot.get('bio') ,
        creditLimit: snapshot.get('creditLimit'),
        date: snapshot.get('date'),
        discountPercentage: snapshot.get('discountPercentage'),
        imageUrl: snapshot.get('imageUrl'),
        location: snapshot.get('location'),
        name: snapshot.get('name'),
        openingBalance: snapshot.get('openingBalance'),
        paymentType: snapshot.get('paymentType'),
        phoneNumber: snapshot.get('phoneNumber'),
        shippingAddress: snapshot.get('shippingAddress'),
        type: snapshot.get('type'),
        );
      }
  Map<String,dynamic> toMap(){
    return {
    'bio': bio,
    'creditLimit': creditLimit,
    'date': date,
    'discountPercentage': discountPercentage,
    'imageUrl': imageUrl,
    'location': location,
    'name': name,
    'openingBalance': openingBalance,
    'paymentType': paymentType,
    'phoneNumber': phoneNumber,
    'shippingAddress': shippingAddress,
    'type': type,
    };
  }
}
