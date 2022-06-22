import 'package:flutter/material.dart';
import 'package:pos_model/widgets/cash_out_bottom_row.dart';

import '../utils/responsive.dart';

class CashOutBottomContainer extends StatelessWidget {
  const CashOutBottomContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height:  Responsive.isDesktop(context)
        ?240: 180,
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.background),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0,left: 5.0,right: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Subtotal',style: Theme.of(context).textTheme.headline6,),
                Text('\$200.00',style: Theme.of(context).textTheme.headline5,),
              ],
            ),
          ),
           Padding(
             padding: const EdgeInsets.only(top: 8.0,left: 5.0,right: 5.0),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tax',style: Theme.of(context).textTheme.headline6,),
                Text('\$45.00',style: Theme.of(context).textTheme.headline5,),
              ],
                     ),
           ),
           Padding(
               padding: const EdgeInsets.only(top: 8.0,left: 5.0,right: 5.0,bottom: 3.0),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Payable Amount',style: Theme.of(context).textTheme.headline5,),
                Text('\$195.00',style: Theme.of(context).textTheme.headline5,),
              ],
                     ),
           ),
           const CashOutBottomRow(),
          
        ],
      ),
      ),
    );
  }
}

