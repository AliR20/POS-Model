import 'package:flutter/material.dart';
import 'package:pos_model/screens/customers/widgets/customer_cashout_tile.dart';
import 'package:pos_model/widgets/cash_out_top_row.dart';

import '../../widgets/cash_out_bottom_container.dart';
import '../../widgets/cash_out_row.dart';
import '../../widgets/cash_out_tile.dart';

class CustomersCheckOutScreen extends StatelessWidget {
  const CustomersCheckOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height * 1.23,
        width: MediaQuery.of(context).size.width * 0.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: CashOutTopRow(
                isCustomer: true,
                leading: CircleAvatar(
                  radius: 26.0,                
                  backgroundImage: NetworkImage('https://picsum.photos/200/300'),
                ),
                title: Text('Vincent Lobo',style: Theme.of(context).textTheme.headline5,),
                subtitle: Text('#542845',style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.grey),),
              ),
            ),
            Divider(
              color: Theme.of(context).colorScheme.background,
              height: 5,
            ),
            CustomerCashOutTile(),
            const SizedBox(
              height: 10.0,
            ),
            const CashOutRow(),
            const CashOutBottomContainer()
          ],
        ),
      ),
    );
  }
}
