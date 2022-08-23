import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import '../../../data/model/food.dart';
import '../../../data/model/food_category.dart';
import '../../../data/repository/repository.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc({required this.repository})
      : super(CategoryState.initial(
            repository.getFoodList, repository.getCategories)) {
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
