part of 'category_bloc.dart';

@immutable
class CategoryState extends Equatable {
  final List<FoodCategory> foodCategories;
  final List<Food> foodList;

  const CategoryState.initial(
    List<Food> foodList,
    List<FoodCategory> foodCategories,
  ) : this(foodList: foodList, foodCategories: foodCategories);

  const CategoryState({required this.foodCategories, required this.foodList});

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
