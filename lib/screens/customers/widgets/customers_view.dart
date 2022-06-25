import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pos_model/screens/customers/models/customer.dart';
import 'package:pos_model/screens/customers/widgets/customer_list.dart';
import 'package:pos_model/screens/customers/widgets/image_container.dart';

class CustomerView extends StatefulWidget {
   CustomerView({Key? key}) : super(key: key);

  @override
  State<CustomerView> createState() => _CustomerViewState();
}

class _CustomerViewState extends State<CustomerView> {
   int index = 0;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('customers')
            .doc(FirebaseAuth.instance.currentUser!.uid).collection('userCustomers')
            .snapshots(),
        builder: (
          context,
          snapshot,
        ) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData) {
            return Center(
              child: Text('There are no Customers yet'),
            );
          }
        
          return ListView(
             children: 
              [
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ImageContainer(
                          height: 150,
                          width: 200,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: snapshot.data!.docs[0]['name'],
                                    style:
                                        Theme.of(context).textTheme.headline1),
                                TextSpan(
                                  text: ' #542845',
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                              ])),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  'vincent.lobo@wanpik.com',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(color: Colors.grey),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text(
                                 snapshot.data!.docs[0]['phoneNumber'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(color: Colors.grey),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  TextButton.icon(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.edit,
                                    ),
                                    label: Text('Edit'),
                                  ),
                                  TextButton.icon(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.delete,
                                    ),
                                    label: Text('Delete'),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 26.0),
                                    child: SizedBox(
                                      width: 100,
                                      height: 40,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: Text('Remove'),
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.white,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                side: BorderSide(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary)),
                                            onPrimary: Theme.of(context)
                                                .colorScheme
                                                .primary),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Recent Customers',
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground),
                      ),
                    ),
                    CustomersList(
                      index: index,
                      onTap: (){
                        setState(() {
                          for (var element in snapshot.data!.docs) {
                            element[index] == index;
                          }
                        });
                      },
                    ),
                  ],
             
                ),
             ],
              );
        });
  }
}
