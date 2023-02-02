import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_japanese_restaurant_app/src/data/model/food.dart';

@immutable
class FoodCategory extends Equatable {
  final FoodType type;
  final bool isSelected;

  @override
  List<Object?> get props => [type, isSelected];

  FoodCategory copyWith({FoodType? type, bool? isSelected}) {
    return FoodCategory(
      type: type ?? this.type,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  const FoodCategory({required this.type, required this.isSelected});

  @override
  String toString() {
    return '\nFoodCategory{type: $type, isSelected: $isSelected}';
  }
}
