import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_japanese_restaurant_app/src/data/model/food.dart';
import 'package:flutter_japanese_restaurant_app/src/data/model/food_category.dart';
import 'package:flutter_japanese_restaurant_app/src/data/repository/repository.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc({required this.repository})
      : super(
          CategoryState.initial(
            repository.getFoodList,
            repository.getCategories,
          ),
        ) {
    on<CategoryEvent>(_filterItemByCategory);
  }

  Repository repository;

  _filterItemByCategory(CategoryEvent event, Emitter<CategoryState> emit) {
    final List<FoodCategory> categories = state.foodCategories.map((element) {
      if (element == event.category) {
        return event.category.copyWith(isSelected: true);
      }
      return element.copyWith(isSelected: false);
    }).toList();

    if (event.category.type == FoodType.all) {
      emit(CategoryState(
          foodCategories: categories, foodList: repository.getFoodList));
    } else {
      final List<Food> foodList = repository.getFoodList
          .where((item) => item.type == event.category.type)
          .toList();
      emit(state.copyWith(foodList: foodList, foodCategories: categories));
    }
  }
}
