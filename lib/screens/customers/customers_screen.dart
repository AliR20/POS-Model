import 'package:flutter/material.dart';
import 'package:pos_model/screens/customers/customers_checkout_screen.dart';
import 'package:pos_model/screens/customers/widgets/add_customer_pop_up.dart';
import 'package:pos_model/screens/customers/widgets/customers_view.dart';
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
          child: FittedBox(
            fit: BoxFit.fitHeight,
            child: Container(
              margin: const EdgeInsets.all(18),
              height: MediaQuery.of(context).size.height * 1.5,
              width: MediaQuery.of(context).size.width ,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Customers',
                            style: Theme.of(context).textTheme.headline1),
                        SizedBox(
                          height: 50,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              showDialog(context: context, builder: (context)=> AddCustomersPopUp());
                            },
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            label: Text(
                              'Add New Customers',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0))),
                    margin: EdgeInsets.all(9.0),
                    height: MediaQuery.of(context).size.height * 1.08,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search Customers....',
                              hintStyle: Theme.of(context).textTheme.headline4,
                              prefixIcon: Icon(Icons.search,color: Theme.of(context).colorScheme.onBackground),
                            ),
                          ),
                        ),
                        SizedBox(height: 15.0,),
                        Expanded(child: CustomerView()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // Spacer(),
        const Flexible(
          flex: 3,
          child: CustomersCheckOutScreen(),
        ),
      ],
    );
  }
}
