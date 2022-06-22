import 'package:flutter/material.dart';

class CashOutRow extends StatelessWidget {
  const CashOutRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.all(8.0),
      width: MediaQuery.of(context).size.width,
      decoration:  BoxDecoration(color: Theme.of(context).colorScheme.outline,borderRadius: BorderRadius.circular(5.0)),
      child: Row(
        children: [
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(primary: Theme.of(context).colorScheme.onBackground),
            child: Text(
              "Add",
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(primary: Theme.of(context).colorScheme.primary),
            child: const Text("Discount"),
          ),
          TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(primary: Theme.of(context).colorScheme.primary),
              child: const Text("Coupon Code")),
          TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(primary: Theme.of(context).colorScheme.primary,shadowColor: Theme.of(context).colorScheme.primary),
              child: const Text("Note")),
        ],
      ),
    );
  }
}
