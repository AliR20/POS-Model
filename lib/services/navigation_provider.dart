import 'package:flutter/material.dart';
import 'package:pos_model/screens/transactions/models/products.dart';

enum NavigatorItem{
 home,
 transactions,
 customers,
 tables,
 cashier,
 orders,
 reports,
 settings,
}
enum TopRowItems{
  starters,
  breakfast,
  lunch,
  supper,
  deserts,
  beverages,
}
class CategoryProvider extends ChangeNotifier{
  Categories? _categories;
  Categories get categories => _categories!;
  void setCategoryItems(Categories item){
    _categories = item;
    notifyListeners();
  }
}
class TopRowProvider extends ChangeNotifier{
  TopRowItems _topRowItem = TopRowItems.starters;
  TopRowItems get topRowItems => _topRowItem;
  void setTopRowItems(TopRowItems item){
    _topRowItem = item;
    notifyListeners();
  }
}
class NavigationProvider extends ChangeNotifier{
  NavigatorItem _navigatorItem = NavigatorItem.customers;
  NavigatorItem get navigationItem => _navigatorItem;
  void setNavigatorItem(NavigatorItem navItem){
    _navigatorItem = navItem;
    notifyListeners();
  }
}