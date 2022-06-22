import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pos_model/screens/transactions/widgets/transaction_container.dart';
import 'package:pos_model/services/navigation_provider.dart';
import 'package:provider/provider.dart';

import '../models/products.dart';

class TransactionContainerList extends StatelessWidget {
  final VoidCallback onExpensesTapped;
  final VoidCallback onIncomeTapped;

  const TransactionContainerList({super.key, required this.onExpensesTapped, required this.onIncomeTapped});
  @override
  Widget build(BuildContext context) {
    return  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TransactionContainer(
                            isIncome: true,
                            name: 'Total Income',
                            amount: '589,209.78',
                            imageUrl: 'assets/icons/arrow_up.svg',
                            info: 'increase compared to last week',
                            onTap: onIncomeTapped,
                            percent: '20',
                          ),
                          
                          TransactionContainer(
                            isIncome: false,
                            name: 'Total Expense',
                            amount: '120,458.90',
                            imageUrl: 'assets/icons/arrow_down.svg',
                            info: 'decrease compared to last week',
                          onTap:onExpensesTapped,
                            percent: '15',
                          ),
                        ],
                      ),
                    );
  }
}