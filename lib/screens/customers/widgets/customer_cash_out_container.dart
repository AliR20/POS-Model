import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/responsive.dart';

class CustomersCashOutContainer extends StatelessWidget {
 final  bool isOdd;
  final String label;
  final String number;
  const CustomersCashOutContainer(
      {
        Key? key,
      this.isOdd = true,
      required this.label,
      required this.number,}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height:  Responsive.isDesktop(context)
        ?50: 45,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(color: isOdd ? Theme.of(context).colorScheme.background : Colors.white),
      child: Row(
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_right_outlined)),
              Text(
                label,
                style: Theme.of(context).textTheme.headline5,
              ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                number,
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          ),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/cross_circle.svg',
                color:  Theme.of(context).colorScheme.onPrimary,
              ))
        ],
      ),
    );
  }
}