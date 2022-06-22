import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../services/navigation_provider.dart';

class TopRowButton extends StatelessWidget {
  const TopRowButton({Key? key, required this.label, required this.item})
      : super(key: key);
  final String label;
  final TopRowItems item;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TopRowProvider>(context);
    final currentItem = provider.topRowItems;
    final isSelected = item == currentItem;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      height: 45,
      width: 80,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected ? Theme.of(context).colorScheme.primary.withOpacity(0.2) : Colors.white,
        border: Border.all(
            width: isSelected ? 1.5 : 0.0,
            color: isSelected ? Theme.of(context).colorScheme.primary: Colors.white),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: InkWell(
        onTap: () => selectItem(context, item),
        child: Text(
          label,
          maxLines: 1,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              color: isSelected ? Theme.of(context).colorScheme.primary : Colors.black),
        ),
      ),
    );
  }

  void selectItem(BuildContext context, TopRowItems item) {
    final provider = Provider.of<TopRowProvider>(context, listen: false);
    provider.setTopRowItems(item);
  }
}
