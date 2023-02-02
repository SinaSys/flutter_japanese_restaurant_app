import 'package:flutter/material.dart';
import 'package:flutter_japanese_restaurant_app/core/app_icon.dart';
import 'package:flutter_japanese_restaurant_app/src/data/model/bottom_navigation_item.dart';

class AppData {
  const AppData._();

  static const List<BottomNavigationItem> bottomNavigationItems = [
    BottomNavigationItem(
      Icon(Icons.home_outlined),
      Icon(Icons.home),
      'Home',
      isSelected: true,
    ),
    BottomNavigationItem(
      Icon(Icons.shopping_cart_outlined),
      Icon(Icons.shopping_cart),
      'Shopping cart',
    ),
    BottomNavigationItem(
      Icon(AppIcon.outlinedHeart),
      Icon(AppIcon.heart),
      'Favorite',
    ),
    BottomNavigationItem(
      Icon(Icons.person_outline),
      Icon(Icons.person),
      'Profile',
    )
  ];
}
