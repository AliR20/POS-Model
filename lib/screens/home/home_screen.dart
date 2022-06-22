import 'package:flutter/material.dart';
import 'package:pos_model/screens/home/widgets/custom_grid_view.dart';
import 'package:pos_model/screens/home/widgets/top_row.dart';
import 'package:pos_model/widgets/search_field.dart';
import '../../utils/responsive.dart';
import '../../widgets/widgets.dart';
import '../screens.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Responsive.isDesktop(context)
        ? Row(
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
                  child: Column(children:  const [
                    MidTopRow(),
                    CustomGridView(),
                  ]),
                ),
              ),
              const Flexible(
                flex: 3,
                child: CashOutScreen(),
              ),
            ],
          )
        : SingleChildScrollView(
            child: Column(
             
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width * 1.4,
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      Row(
                        children: [
                          SearchField(searchController: searchController),
                          const SizedBox(
                            width: 40.0,
                          ),
                          DecoratedBox(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Theme.of(context).colorScheme.primary),
                            child: IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const CashOutScreen()));
                              },
                              icon: const Icon(
                                Icons.attach_money,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      const MidTopRow(),
                      const CustomGridView(),
                    ],
                  )),
                ),
              ],
            ),
          );
  }
}
