import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class CustomersList extends StatelessWidget {
  CustomersList({Key? key, required this.index, required this.onTap}) : super(key: key);

    int index;
    final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('customers')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('userCustomers')
            .snapshots(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          if(!snapshot.hasData){
            return Center(child: Text('There are no Customers'));
          }
          return ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context,index) {
                return ListTile(
                  leading: Container(
                    width: 60,
                    height: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://picsum.photos/200/300',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(snapshot.data!.docs[index]['name']),
                  subtitle: Text('ben.cole@gmail.com'),
                  trailing: Text(snapshot.data!.docs[index]['date']),
                  onTap: onTap,
                );
              });
        });
  }
}
