import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pos_model/screens/login/services/firebase_services.dart';
import 'package:pos_model/services/navigation_provider.dart';
import 'package:pos_model/widgets/side_drawer_list.dart';

import '../utils/responsive.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: Responsive.isMobile(context)?160: null,
      backgroundColor: Colors.white,
      child: FittedBox(
        fit: BoxFit.fitHeight,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 1.2,
          width: MediaQuery.of(context).size.width * 0.4,
          child: Column(
            children: [
              const SizedBox(
                height: 6.0,
              ),
              const SideList(
                  label: 'Home', icon: Icons.home, item: NavigatorItem.home),
                    const SideList(
                  label: 'Transactions',
                  icon: Icons.dashboard,
                  item: NavigatorItem.transactions),
              const SideList(
                  label: 'Customers',
                  icon: Icons.person_outlined,
                  item: NavigatorItem.customers),
              const SideList(
                  label: 'Tables',
                  icon: Icons.apps,
                  item: NavigatorItem.tables),
              const SideList(
                  label: 'Cashier',
                  icon: Icons.attach_money_outlined,
                  item: NavigatorItem.cashier),
              const SideList(
                  label: 'Orders',
                  icon: Icons.shopping_bag_outlined,
                  item: NavigatorItem.orders),
              const SideList(
                  label: 'Reports',
                  icon: Icons.person_outlined,
                  item: NavigatorItem.reports),
              const SideList(
                  label: 'Settings',
                  icon: Icons.person_outlined,
                  item: NavigatorItem.settings),
                const Spacer(),
                         const CircleAvatar(backgroundImage: NetworkImage('https://picsum.photos/200/300'),),
                const SizedBox(height: 10,)
            ,    
                         Theme(
                           data: ThemeData(highlightColor:Theme.of(context).colorScheme.primary),
                           child: Material(
                            
                             child: SizedBox(
                               height: 60,
                               width: 110,
                               child: ListTile(
                                 
                      
                                 
                                onTap: ()async {
                                  await FirebaseMethods.signOut();
                                },
                                     title: const Icon(Icons.logout),
                                     subtitle: const Text('Logout',textAlign: TextAlign.center,)
                                  
                                 
                               ),
                             ),
                           ),
                         ),
            ],
          ),
        ),
      ),
    );
  }
}
