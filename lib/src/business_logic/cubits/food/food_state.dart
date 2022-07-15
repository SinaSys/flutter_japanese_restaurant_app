part of 'food_cubit.dart';

class FoodState extends Equatable {
  final List<Food> foodList;

  const FoodState({
    required this.foodList,
  });

  factory FoodState.initial() => const FoodState(foodList: AppData.foodItems);

  @override
  List<Object?> get props => [foodList];

  FoodState copyWith({
    List<Food>? foodList,
  }) {
    return FoodState(
      foodList: foodList ?? this.foodList,
    );
  }

  @override
  String toString() {
    return 'FoodState{foodList: $foodList}';
  }
}
