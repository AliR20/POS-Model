import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DataTableStream extends StatelessWidget {
  const DataTableStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('products')
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .collection('userProducts')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (snapshot.hasData) {
                            return DataTable2(
                                columnSpacing: 12,
                                horizontalMargin: 12,
                                minWidth: 600,
                                dataTextStyle:
                                    Theme.of(context).textTheme.headline3,
                                headingTextStyle: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(fontSize: 22.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.orange,
                                    ),
                                    borderRadius: BorderRadius.circular(5.0)),
                                columns: [
                                  DataColumn2(
                                    label: Text('Name'),
                                  ),
                                  DataColumn2(
                                    label: Text('Category'),
                                  ),
                                  DataColumn2(
                                    label: Text('Date'),
                                  ),
                                  DataColumn2(
                                    label: Text('Cost'),
                                  ),
                                ],
                                rows: List<DataRow>.generate(
                                    snapshot.data!.docs.length,
                                    (index) => DataRow(
                                            color: MaterialStateProperty.all(
                                              snapshot.data!.docs[index]
                                                          ['category'] ==
                                                      'INCOME'
                                                  ? Colors.green
                                                  : Colors.red,
                                            ),
                                            cells: [
                                              DataCell(Text(snapshot
                                                  .data!.docs[index]['name'])),
                                              DataCell(Text(snapshot.data!
                                                  .docs[index]['category'])),
                                              DataCell(Text(snapshot
                                                  .data!.docs[index]['date'])),
                                              DataCell(Text(
                                                  '\$ ${snapshot.data!.docs[index]['amount']}')),
                                            ])));
                          }
                          return Center(
                            child: Text('You have no products yet'),
                          );
                        });
  }
}