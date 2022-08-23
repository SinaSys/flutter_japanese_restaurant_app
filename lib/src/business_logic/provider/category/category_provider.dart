import 'package:flutter/foundation.dart' show ChangeNotifier;

import '../../../data/model/food.dart';
import '../../../data/model/food_category.dart';
import '../../../data/repository/repository.dart';
import 'category_state.dart';

class CategoryProvider with ChangeNotifier {
  CategoryState _state;

  Repository repository;

  CategoryProvider({
    required this.repository,
  }) : _state = CategoryState.initial(
            repository.getFoodList, repository.getCategories);

  CategoryState get state => _state;

  filterItemByCategory(FoodCategory category) {
    final List<FoodCategory> categories = _state.foodCategories.map((element) {
      if (element == category) {
        return category.copyWith(isSelected: true);
      }
      return element.copyWith(isSelected: false);
    }).toList();

    if (category.type == FoodType.all) {
      _state = _state.copyWith(
          foodList: repository.getFoodList, foodCategories: categories);
    } else {
      final List<Food> foodList = repository.getFoodList
          .where((item) => item.type == category.type)
          .toList();

      _state = _state.copyWith(foodList: foodList, foodCategories: categories);
    }
    notifyListeners();
  }
}
