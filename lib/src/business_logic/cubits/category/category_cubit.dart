import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_japanese_restaurant_app/src/data/model/food.dart';
import 'package:flutter_japanese_restaurant_app/src/data/model/food_category.dart';
import 'package:flutter_japanese_restaurant_app/src/data/repository/repository.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit({required this.repository})
      : super(
          CategoryState.initial(
            repository.getFoodList,
            repository.getCategories,
          ),
        );

  Repository repository;

  filterItemByCategory(FoodCategory category) {
    final List<FoodCategory> categories = state.foodCategories.map((element) {
      if (element == category) {
        return category.copyWith(isSelected: true);
      }
      return element.copyWith(isSelected: false);
    }).toList();

    if (category.type == FoodType.all) {
      emit(CategoryState(
          foodCategories: categories, foodList: repository.getFoodList));
    } else {
      final List<Food> foodList = repository.getFoodList
          .where((item) => item.type == category.type)
          .toList();
      emit(state.copyWith(foodList: foodList, foodCategories: categories));
    }
  }
}
