import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/navigation_provider.dart';
import '../utils/responsive.dart';

class SideList extends StatelessWidget {
  final String label;
  final IconData icon;
  final NavigatorItem item;

  const SideList(
      {super.key, required this.label, required this.icon, required this.item});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NavigationProvider>(context);
    final currentItem = provider.navigationItem;
    final isSelected = item == currentItem;
    return Material(
      color: Colors.transparent,
      child: Container(
        height: Responsive.isDesktop(context)?75: 85,
        width: 110,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(6.0)),
            border: Border.all(
                width: 2,
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Colors.white)),
        child: ListTile(
          selected: isSelected,
          selectedTileColor:
              Theme.of(context).colorScheme.primary.withOpacity(0.2),
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              icon,
              color: isSelected ? Colors.orange : Colors.grey,
              size: 30,
            ),
          ),
          onTap: () => selectItem(context, item),
          subtitle: Text(
            label,
            textAlign: TextAlign.center,
            maxLines: 1,
            style: TextStyle(color: isSelected ? Colors.orange : Colors.grey,fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  void selectItem(BuildContext context, NavigatorItem item) {
    final provider = Provider.of<NavigationProvider>(context, listen: false);
    provider.setNavigatorItem(item);
  }
}
