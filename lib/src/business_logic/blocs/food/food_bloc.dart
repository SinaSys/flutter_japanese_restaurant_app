import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_japanese_restaurant_app/core/app_extension.dart';
import 'package:flutter_japanese_restaurant_app/src/data/model/food.dart';
import 'package:flutter_japanese_restaurant_app/src/data/repository/repository.dart';

part 'food_event.dart';

part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  FoodBloc({
    required this.repository,
  }) : super(FoodState.initial(repository.getFoodList)) {
    on<IncreaseQuantityEvent>(_increaseQuantity);
    on<DecreaseQuantityEvent>(_decreaseQuantity);
    on<RemoveItemEvent>(_removeItem);
    on<FavoriteItemEvent>(_isFavorite);
    on<AddToCartEvent>(_addToCart);
  }

  Repository repository;

  void _increaseQuantity(IncreaseQuantityEvent event, Emitter<FoodState> emit) {
    int index = state.foodList.getIndex(event.food);
    final List<Food> foodList = state.foodList.map((element) {
      if (element.id == event.food.id) {
        return state.foodList[index]
            .copyWith(quantity: state.foodList[index].quantity + 1);
      }
      return element;
    }).toList();

    emit(FoodState(foodList: foodList));
  }

  void _decreaseQuantity(DecreaseQuantityEvent event, Emitter<FoodState> emit) {
    int index = state.foodList.getIndex(event.food);

    final List<Food> foodList = state.foodList.map((element) {
      if (element.id == event.food.id && element.quantity > 1) {
        return state.foodList[index]
            .copyWith(quantity: state.foodList[index].quantity - 1);
      }
      //for Item quantity less than zero this statement will be called
      if (element.id == event.food.id) {
        //Remove item from cart
        return state.foodList[index].copyWith(cart: false);
      }
      return element;
    }).toList();
    emit(FoodState(foodList: foodList));
  }

  void _removeItem(RemoveItemEvent event, Emitter<FoodState> emit) {
    final List<Food> foodList = state.foodList.map((element) {
      if (element.id == event.food.id) {
        return event.food.copyWith(cart: false);
      }
      return element;
    }).toList();

    emit(FoodState(foodList: foodList));
  }

  void _isFavorite(FavoriteItemEvent event, Emitter<FoodState> emit) {
    int index = state.foodList.getIndex(event.food);
    final List<Food> foodList = state.foodList.map((element) {
      if (element.id == event.food.id) {
        return event.food
            .copyWith(isFavorite: !state.foodList[index].isFavorite);
      }
      return element;
    }).toList();
    emit(FoodState(foodList: foodList));
  }

  void _addToCart(AddToCartEvent event, Emitter<FoodState> emit) {
    int index = state.foodList.getIndex(event.food);

    final List<Food> cartFood = state.foodList.map((element) {
      if (element.id == event.food.id) {
        return state.foodList[index].copyWith(cart: true);
      }
      return element;
    }).toList();

    emit(FoodState(foodList: cartFood));
  }

  String pricePerEachItem(Food food) {
    double price = 0;
    price = food.quantity * food.price;
    return price.toString();
  }

  double get getTotalPrice {
    double totalPrice = 5;
    for (var element in state.foodList) {
      if (element.cart) {
        totalPrice += element.quantity * element.price;
      }
    }
    return totalPrice;
  }

  get getCartList => state.foodList.where((element) => element.cart).toList();

  get getFavoriteList =>
      state.foodList.where((element) => element.isFavorite).toList();
}
