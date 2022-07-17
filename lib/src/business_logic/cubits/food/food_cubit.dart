import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_japanese_restaurant_app/core/app_extension.dart';
import 'package:flutter_japanese_restaurant_app/src/data/model/food.dart';
import 'package:flutter_japanese_restaurant_app/src/data/repository/repository.dart';

part 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit({required this.repository})
      : super(FoodState.initial(repository.getFoodList));

  Repository repository;

  void increaseQuantity(Food food) {
    int index = state.foodList.getIndex(food);
    final List<Food> foodList = state.foodList.map((element) {
      if (element.id == food.id) {
        return state.foodList[index]
            .copyWith(quantity: state.foodList[index].quantity + 1);
      }
      return element;
    }).toList();

    emit(FoodState(foodList: foodList));
  }

  void decreaseQuantity(Food food) {
    int index = state.foodList.getIndex(food);

    final List<Food> foodList = state.foodList.map((element) {
      if (element.id == food.id && element.quantity > 1) {
        return state.foodList[index]
            .copyWith(quantity: state.foodList[index].quantity - 1);
      }
      //for Item quantity less than zero this statement will be called
      if (element.id == food.id) {
        //Remove item from cart
        return state.foodList[index].copyWith(cart: false);
      }
      return element;
    }).toList();
    emit(FoodState(foodList: foodList));
  }

  void removeItem(Food food) {
    final List<Food> foodList = state.foodList.map((element) {
      if (element.id == food.id) {
        return food.copyWith(cart: false);
      }
      return element;
    }).toList();

    emit(FoodState(foodList: foodList));
  }

  void isFavorite(Food food) {
    int index = state.foodList.getIndex(food);
    final List<Food> foodList = state.foodList.map((element) {
      if (element.id == food.id) {
        return food.copyWith(isFavorite: !state.foodList[index].isFavorite);
      }
      return element;
    }).toList();
    emit(FoodState(foodList: foodList));
  }

  void addToCart(Food food) {
    int index = state.foodList.getIndex(food);

    final List<Food> cartFood = state.foodList.map((element) {
      if (element.id == food.id) {
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
