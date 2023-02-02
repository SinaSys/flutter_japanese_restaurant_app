import 'package:flutter/material.dart';

class BottomNavigationItem {
  final Widget disableIcon;
  final Widget enableIcon;
  String label;
  bool isSelected;

  BottomNavigationItem(
    this.disableIcon,
    this.enableIcon,
    this.label, {
    this.isSelected = false,
  });
}
