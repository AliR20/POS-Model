import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pos_model/screens/transactions/models/products.dart';
import 'package:pos_model/screens/transactions/widgets/alert_dialog_popup.dart';
import 'package:pos_model/screens/transactions/widgets/transaction_container_list.dart';
import 'package:pos_model/services/navigation_provider.dart';
import 'package:pos_model/utils/responsive.dart';
import 'package:provider/provider.dart';

import '../../widgets/side_drawer.dart';
import '../cash_out_screen.dart';

class TransactionScreen extends StatefulWidget {
  TransactionScreen({Key? key}) : super(key: key);

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  bool expensesTapped = false;
  bool incomeTapped = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Responsive.isDesktop(context)
            ? Flexible(
                child: Container(
                  color: Theme.of(context).colorScheme.background,
                  width: 140,
                  child: const SideDrawer(),
                ),
              )
            : Container(),
        Flexible(
          flex: 6,
          child: FittedBox(
            fit: BoxFit.fitHeight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 1.7,
                width: MediaQuery.of(context).size.width * 1.15,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Transactions',
                              style: Theme.of(context).textTheme.headline1),
                          SizedBox(
                            height: 53,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialogPopUp());
                              },
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              label: Text(
                                'Add Income/Expenses',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TransactionContainerList(
                      onExpensesTapped: () {
                        setState(() {
                          expensesTapped = !expensesTapped;
                          incomeTapped = false;
                        });
                      },
                      onIncomeTapped: () {
                        setState(() {
                          incomeTapped = !incomeTapped;
                          expensesTapped = false;
                        });
                      },
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'Recent Files',
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.sort),
                            label: Text('Sort By'),
                          ),
                        ],
                      ),
                    ),
                    StreamBuilder<QuerySnapshot>(
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
                        }),
                  ],
                ),
              ),
            ),
          ),
        ),
        Flexible(
          flex: 3,
          child: CashOutScreen(),
        ),
      ],
    );
  }
}
