import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/responsive.dart';

class CashOutTileContainer extends StatelessWidget {
 final  bool isOdd;
  final String? subtitle;
  final String label;
  final String number;
  final String? subAmount;
  final int numb;
  const CashOutTileContainer(
      {
        Key? key,
        required this.numb,
      this.isOdd = true,
      this.subtitle,
      required this.label,
      required this.number,
      this.subAmount}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height:  Responsive.isDesktop(context)
        ?60: 45,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(color: isOdd ? Theme.of(context).colorScheme.background : Colors.white),
      child: Row(
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_right_outlined)),
          Text('$numb  '),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.headline5,
              ),
              subtitle != null
                  ? Text(
                      subtitle!,
                      style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                    )
                  : const SizedBox(),
            ],
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '\$ $number',
                style: Theme.of(context).textTheme.headline5,
              ),
              subAmount != null
                  ? Text(
                      '\$ $subAmount',
                      style:  TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color:  Theme.of(context).colorScheme.onPrimary),
                    )
                  : Container(),
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
