import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pos_model/screens/customers/widgets/customer_cash_out_container.dart';

import '../../../utils/responsive.dart';

class CustomerCashOutTile extends StatelessWidget {
  const CustomerCashOutTile({Key? key, required this.snapshot}) : super(key: key);
  final QuerySnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Responsive.isDesktop(context) ? 450 : 250,
      width: 600,
      child: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
                  itemBuilder: (context, int index) {
                    return Column(
                      children: [
                        CustomersCashOutContainer(
                          label: 'Credit Limit',
                          number: snapshot.docs.first['creditLimit'],
                        ),
                        CustomersCashOutContainer(
                          label: 'Available Credit',
                          number: 
                         ' ${snapshot.docs.first['openingBalance']}'
                                  ,
                        ),
                        CustomersCashOutContainer(
                          label: 'Total Purchase',
                          number: snapshot.docs.first['openingBalance'],
                        ),
                        CustomersCashOutContainer(
                          label: 'Discount Percentage',
                          number: snapshot.docs.first['discountPercentage'],
                        ),
                        CustomersCashOutContainer(
                          label: 'Customer Level',
                          number: 'Intermediate',
                        ),
                        CustomersCashOutContainer(
                          label: 'Clearence Date',
                          number: snapshot.docs.first['date'],
                        ),
                      ],
                    );
                  }
        ),
      ),
    );
  }
}
