part of 'food_bloc.dart';

class FoodState extends Equatable {
  final List<Food> foodList;

  const FoodState({
    required this.foodList,
  });

  const FoodState.initial(List<Food> foodList) : this(foodList: foodList);

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
