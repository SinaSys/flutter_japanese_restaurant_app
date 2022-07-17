import 'package:flutter/material.dart';
import '../src/data/model/bottom_navigation_item.dart';

import 'app_icon.dart';

class AppData {
  const AppData._();

  static const List<BottomNavigationItem> bottomNavigationItems = [
    BottomNavigationItem(Icon(Icons.home_outlined), Icon(Icons.home), 'Home',
        isSelected: true),
    BottomNavigationItem(Icon(Icons.shopping_cart_outlined),
        Icon(Icons.shopping_cart), 'Shopping cart'),
    BottomNavigationItem(
        Icon(AppIcon.outlinedHeart), Icon(AppIcon.heart), 'Favorite'),
    BottomNavigationItem(
        Icon(Icons.person_outline), Icon(Icons.person), 'Profile')
  ];
}
