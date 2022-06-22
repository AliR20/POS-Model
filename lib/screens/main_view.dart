import 'package:flutter/material.dart';
import 'package:pos_model/screens/screens.dart';
import 'package:pos_model/screens/transactions/transaction_screen.dart';
import 'package:pos_model/services/navigation_provider.dart';
import 'package:pos_model/utils/constant.dart';
import 'package:pos_model/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../utils/responsive.dart';
import '../widgets/search_field.dart';

class MainView extends StatelessWidget {
  MainView({Key? key}) : super(key: key);
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 1.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
        ),
        title: Responsive.isDesktop(context)? Row(
          children: [
            Text('Restro POS', style: Theme.of(context).textTheme.headline1),
            const SizedBox(
              width: 15.0,
            ),
            SearchField(searchController: searchController),
          ],
        ): Text('Restro POS',style: Theme.of(context).textTheme.headline3!.copyWith(color: darkColor),),
        centerTitle: false,
        backgroundColor: Colors.white,
        actions: const [
          TopIconRow(),
        ],
      ),
      drawer: Responsive.isMobile(context)?const SideDrawer(): null,
      body: buildPages(context),
    );
  }
   Widget buildPages(BuildContext context){
     final provider = Provider.of<NavigationProvider>(context);
    final item = provider.navigationItem;
    switch (item) {
      case NavigatorItem.home:
        return  HomeScreen();
      case NavigatorItem.customers:
        return const CustomersScreen();
      case NavigatorItem.tables:
        return const TablesScreen();
      case NavigatorItem.cashier:
        return  const CashiersScreen();
      case NavigatorItem.orders:
        return  const OrdersScreen();
      case NavigatorItem.reports:
        return const ReportsScreen();
      case NavigatorItem.settings:
        return const SettingsScreen();
      case NavigatorItem.transactions:
        return TransactionScreen();
    }}
}

