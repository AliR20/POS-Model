import 'package:flutter/material.dart';
import 'package:pos_model/utils/responsive.dart';
import 'package:pos_model/widgets/cash_out_tile_container.dart';

class CashOutTile extends StatelessWidget {
  const CashOutTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height:  Responsive.isDesktop(context)
        ? 300 : 250,
      width: 600,
      child: SingleChildScrollView(
        child: Column(
            children: const [
              CashOutTileContainer(numb: 1,label: 'Schezwan Egg Noodles',number: '25.00',),
              CashOutTileContainer(numb: 2,isOdd: false,subtitle: 'Medium-Half Grilled',label: 'Spicy Shrimp Soup',number: '40.00',subAmount: '50.00',),
              CashOutTileContainer(numb: 2,subtitle: 'Medium',number: '40.00',label: 'Thai Style Fried Noodles',subAmount: '50.00',),
              CashOutTileContainer(numb: 3,isOdd: false,label: 'Fried Basil',number: '75.00',),
              
            ],
          
        ),
      ),
    );
  }
}

