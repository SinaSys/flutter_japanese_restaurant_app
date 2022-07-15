import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_japanese_restaurant_app/core/app_data.dart';
import 'package:flutter_japanese_restaurant_app/src/data/model/food.dart';
import 'package:flutter_japanese_restaurant_app/src/data/model/food_category.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryState.initial());

  filterItemByCategory(FoodCategory category) {

    final List<FoodCategory> categories = state.foodCategories.map((element) {
      if (element == category) {
        return category.copyWith(isSelected: true);
      }
      return element.copyWith(isSelected: false);
    }).toList();

     if (category.type == FoodType.all) {
       emit(CategoryState(foodCategories: categories, foodList: state.foodList));
     } else {
       final List<Food> foodList =
           AppData.foodItems.where((item) => item.type == category.type).toList();
       emit(state.copyWith(foodList: foodList,foodCategories: categories));
     }

  }

}
