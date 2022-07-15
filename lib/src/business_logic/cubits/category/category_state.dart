part of 'category_cubit.dart';

class CategoryState extends Equatable {
  final List<FoodCategory> foodCategories;
  final List<Food> foodList;

  factory CategoryState.initial() {
    return const CategoryState(
        foodCategories: AppData.categories, foodList: AppData.foodItems);
  }

  const CategoryState({
    required this.foodCategories,
    required this.foodList,
  });

  @override
  List<Object?> get props => [foodCategories, foodList];

  CategoryState copyWith({
    List<FoodCategory>? foodCategories,
    List<Food>? foodList,
  }) {
    return CategoryState(
      foodCategories: foodCategories ?? this.foodCategories,
      foodList: foodList ?? this.foodList,
    );
  }
}
