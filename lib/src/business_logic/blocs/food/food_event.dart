part of 'food_bloc.dart';

abstract class FoodEvent extends Equatable {
  final Food food;

  const FoodEvent(this.food);

  @override
  List<Object?> get props => [food];
}

class IncreaseQuantityEvent extends FoodEvent {
  const IncreaseQuantityEvent(super.food);
}

class DecreaseQuantityEvent extends FoodEvent {
  const DecreaseQuantityEvent(super.food);
}

class RemoveItemEvent extends FoodEvent {
  const RemoveItemEvent(super.food);
}

class AddToCartEvent extends FoodEvent {
  const AddToCartEvent(super.food);
}

class FavoriteItemEvent extends FoodEvent {
  const FavoriteItemEvent(super.food);
}
