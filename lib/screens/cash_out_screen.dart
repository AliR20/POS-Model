import 'package:flutter/material.dart';
import 'package:pos_model/widgets/cash_out_bottom_container.dart';
import 'package:pos_model/widgets/cash_out_row.dart';
import 'package:pos_model/widgets/cash_out_tile.dart';
import 'package:pos_model/widgets/cash_out_top_row.dart';

import '../utils/responsive.dart';

class CashOutScreen extends StatelessWidget {
  const CashOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive.isDesktop(context)
        ? FittedBox(
            fit: BoxFit.fitHeight,
            child: Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 1.23,
              width: MediaQuery.of(context).size.width * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CashOutTopRow(),
                  Divider(
                    color: Theme.of(context).colorScheme.background,
                    height: 5,
                  ),
                  const CashOutTile(),
                  const SizedBox(
                    height: 140.0,
                  ),
                  const CashOutRow(),
                  const CashOutBottomContainer()
                ],
              ),
            ),
          )
        : Scaffold(
          backgroundColor: Colors.white,
            appBar: AppBar(
             elevation: 0.0,
              backgroundColor: Colors.white,
              centerTitle: true,
              title: Text(
                'Cashout',
                style: Theme.of(context).textTheme.headline1!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontStyle: FontStyle.italic),
              ),
            ),
            body: Column(
              children: [
                const CashOutTopRow(),
                Divider(
                  color: Theme.of(context).colorScheme.background,
                  height: 5,
                ),
                const CashOutTile(),
                SizedBox(
                  height:  Responsive.isDesktop(context) ?140.0: 30,
                ),
                const CashOutRow(),
                const CashOutBottomContainer()
              ],
            ),
          );
  }
}
