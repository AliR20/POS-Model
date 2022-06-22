import 'package:flutter/material.dart';
import 'package:pos_model/widgets/side_drawer.dart';

import '../cash_out_screen.dart';

class CustomersScreen extends StatelessWidget {
  const CustomersScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Container(
            color: Theme.of(context).colorScheme.background,
            width: 140,
            child: const SideDrawer(),
          ),
        ),
        Flexible(
          flex: 6,
          child: Container(
            margin: const EdgeInsets.all(18),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              children: [
                Row(
                  children: [
                    Text('Customers',
                        style: Theme.of(context).textTheme.headline1),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.add),
                      label: Text(
                        'Add Customers',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const Flexible(
          flex: 3,
          child: CashOutScreen(),
        ),
      ],
    );
  }
}
