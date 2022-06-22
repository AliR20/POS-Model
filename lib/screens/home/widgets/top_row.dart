import 'package:flutter/material.dart';
import 'package:pos_model/screens/home/widgets/top_row_button.dart';

import '../../../services/navigation_provider.dart';
import '../../../utils/responsive.dart';

class MidTopRow extends StatelessWidget {
  const MidTopRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      alignment: Alignment.center,
      height: 50,
      width: Responsive.isDesktop(context)
          ? MediaQuery.of(context).size.width * 0.56
          : MediaQuery.of(context).size.width * 1.35,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Responsive.isDesktop(context)
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                TopRowButton(
                  label: 'Starters',
                  item: TopRowItems.starters,
                ),
                TopRowButton(
                  label: 'Breakfast',
                  item: TopRowItems.breakfast,
                ),
                TopRowButton(
                  label: 'Lunch',
                  item: TopRowItems.lunch,
                ),
                TopRowButton(
                  label: 'Supper',
                  item: TopRowItems.supper,
                ),
                TopRowButton(
                  label: 'Deserts',
                  item: TopRowItems.deserts,
                ),
                TopRowButton(
                  label: 'Beverages',
                  item: TopRowItems.beverages,
                ),
              ],
            )
          : Container(
              padding: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  const TopRowButton(
                    label: 'Starters',
                    item: TopRowItems.starters,
                  ),
                  const TopRowButton(
                    label: 'Breakfast',
                    item: TopRowItems.breakfast,
                  ),
                  const TopRowButton(
                    label: 'Lunch',
                    item: TopRowItems.lunch,
                  ),
                  const TopRowButton(
                    label: 'Supper',
                    item: TopRowItems.supper,
                  ),
                  const TopRowButton(
                    label: 'Deserts',
                    item: TopRowItems.deserts,
                  ),
                  const TopRowButton(
                    label: 'Beverages',
                    item: TopRowItems.beverages,
                  ),
                ],
              ),
            ),
    );
  }
}
