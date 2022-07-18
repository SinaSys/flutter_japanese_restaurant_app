part of 'food_bloc.dart';

abstract class FoodEvent extends Equatable {
  final Food food;

  const FoodEvent(this.food);

  @override
  List<Object?> get props => [food];
}

class IncreaseQuantityEvent extends FoodEvent {
  const IncreaseQuantityEvent(Food food) : super(food);
}

class DecreaseQuantityEvent extends FoodEvent {
  const DecreaseQuantityEvent(Food food) : super(food);
}

class RemoveItemEvent extends FoodEvent {
  const RemoveItemEvent(Food food) : super(food);
}

class AddToCartEvent extends FoodEvent {
  const AddToCartEvent(Food food) : super(food);
}

class FavoriteItemEvent extends FoodEvent {
  const FavoriteItemEvent(Food food) : super(food);
}
