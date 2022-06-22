import 'package:flutter/material.dart';
import 'package:pos_model/screens/transactions/widgets/income_view.dart';

class AlertDialogPopUp extends StatefulWidget {
  const AlertDialogPopUp({Key? key}) : super(key: key);

  @override
  State<AlertDialogPopUp> createState() => _AlertDialogPopUpState();
}

class _AlertDialogPopUpState extends State<AlertDialogPopUp>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  int tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: FittedBox(
        fit: BoxFit.fitHeight,
        child: SizedBox(
          width: 500,
          child: Column(
            children: [
              TabBar(
                indicator: BoxDecoration(
                  border:
                      Border.all(color: Theme.of(context).colorScheme.primary),
                  borderRadius: BorderRadius.circular(5.0),
                  color: Theme.of(context).colorScheme.outline,
                ),
                labelColor: Theme.of(context).colorScheme.primary,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Theme.of(context).colorScheme.primary,
                labelStyle: Theme.of(context).textTheme.headline2,
                onTap: (int index) {
                  setState(() {
                    tabIndex = index;
                  });
                },
                controller: tabController,
                tabs: [
                  Text(
                    'Income',
                  ),
                  Text(
                    'Expense',
                  )
                ],
              ),
             Padding(
                padding: const EdgeInsets.all(8.0),
                child: IncomeView(
                  index : tabIndex,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
