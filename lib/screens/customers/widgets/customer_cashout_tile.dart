import 'package:flutter/material.dart';
import 'package:pos_model/screens/customers/widgets/customer_cash_out_container.dart';

import '../../../utils/responsive.dart';

class CustomerCashOutTile extends StatelessWidget {
  const CustomerCashOutTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:  Responsive.isDesktop(context)
        ? 425 : 250,
      width: 600,
      child: SingleChildScrollView(
        child: Column(
            children:[
              CustomersCashOutContainer(
                  label: 'Credit Limit',
                  number: '\$5000',
              ),
                CustomersCashOutContainer(
                  label: 'Available Credit',
                  number: '\$3000',
              ),
                CustomersCashOutContainer(
                  label: 'Total Purchase',
                  number: '\$2000',
              ),
               CustomersCashOutContainer(
                  label: 'Discount Percentage',
                  number: '20%',
              ),
                 CustomersCashOutContainer(
                  label: 'Customer Level',
                  number: 'Intermediate',
              ),
                 CustomersCashOutContainer(
                  label: 'Clearence Date',
                  number: '30/05/2022',
              ),
            ],),),);
  }
}