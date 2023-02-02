import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' show Widget, immutable;

@immutable
class BottomNavigationItem extends Equatable {
  final Widget disableIcon;
  final Widget enableIcon;
  final String label;
  final bool isSelected;

  const BottomNavigationItem(
    this.disableIcon,
    this.enableIcon,
    this.label, {
    this.isSelected = false,
  });

  @override
  List<Object?> get props => [disableIcon, enableIcon, label, isSelected];
}
