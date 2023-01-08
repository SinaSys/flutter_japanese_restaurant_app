import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;

import '../../../data/model/food.dart';
import '../../../data/model/food_category.dart';
import '../../../data/repository/repository.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit({required this.repository})
      : super(CategoryState.initial(
            repository.getFoodList, repository.getCategories));

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
