import 'package:flutter/material.dart';
import 'package:pos_model/screens/transactions/widgets/date_picker_alert.dart';
import 'package:pos_model/screens/transactions/widgets/recent_file_row.dart';
import 'package:pos_model/screens/transactions/widgets/side_graph.dart';
import 'package:pos_model/screens/transactions/widgets/top_row.dart';
import 'package:pos_model/screens/transactions/widgets/transaction_container_list.dart';
import 'package:pos_model/utils/responsive.dart';
import '../../widgets/side_drawer.dart';
import 'widgets/data_table_stream.dart';

class TransactionScreen extends StatefulWidget {
  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  bool expensesTapped = false;
  bool incomeTapped = false;
  String orderBy = 'All';
  List<String> orderByList = [
    'All',
    'Date',
    'Category',
    'Amount',
  ];
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
                  TopRow(),
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
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 50,
                            child: TextButton.icon(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.white,
                                  side: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.primary)),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => DatePickerAlert());
                              },
                              icon: Icon(Icons.calendar_month),
                              label: Text('Select a Date Range'),
                            ),
                          ),
                        ],
                      ),
                    ),
              RecentFileRow(
                value: orderBy,
                items: orderByList,
                onChanged: (newValue){
                  setState(() {
                    orderBy = newValue!;
                  });
                },
              ),
                    SizedBox(
                      height: 20,
                    ),
                   DataTableStream(),
                  ],
                ),
              ),
            ),
          ),
        ),
        Flexible(
          flex: 3,
          child: SideGraph(),
        ),
      ],
    );
  }
}
