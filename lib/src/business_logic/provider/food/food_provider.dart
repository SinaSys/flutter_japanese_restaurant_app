import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:flutter_japanese_restaurant_app/core/app_extension.dart';
import 'package:flutter_japanese_restaurant_app/src/data/model/food.dart';
import 'package:flutter_japanese_restaurant_app/src/data/repository/repository.dart';
import 'package:flutter_japanese_restaurant_app/src/business_logic/provider/food/food_state.dart';

class FoodProvider with ChangeNotifier {
  FoodState _state;

  final Repository repository;

  FoodProvider({
    required this.repository,
  }) : _state = FoodState.initial(repository.getFoodList);

  FoodState get state => _state;

  void increaseQuantity(Food food) {
    int index = _state.foodList.getIndex(food);
    final List<Food> foodList = _state.foodList.map((element) {
      if (element.id == food.id) {
        return _state.foodList[index]
            .copyWith(quantity: _state.foodList[index].quantity + 1);
      }
      return element;
    }).toList();

    _state = _state.copyWith(foodList: foodList);
    notifyListeners();
  }

  void decreaseQuantity(Food food) {
    int index = _state.foodList.getIndex(food);

    final List<Food> foodList = _state.foodList.map((element) {
      if (element.id == food.id && element.quantity > 1) {
        return _state.foodList[index].copyWith(
          quantity: _state.foodList[index].quantity - 1,
        );
      }
      //for Item quantity less than zero this statement will be called
      if (element.id == food.id) {
        //Remove item from cart
        return _state.foodList[index].copyWith(cart: false);
      }
      return element;
    }).toList();
    _state = _state.copyWith(foodList: foodList);
    notifyListeners();
  }

  void removeItem(Food food) {
    final List<Food> foodList = _state.foodList.map((element) {
      if (element.id == food.id) {
        return food.copyWith(cart: false);
      }
      return element;
    }).toList();

    _state = _state.copyWith(foodList: foodList);
    notifyListeners();
  }

  void isFavorite(Food food) {
    int index = _state.foodList.getIndex(food);
    final List<Food> foodList = _state.foodList.map((element) {
      if (element.id == food.id) {
        return food.copyWith(isFavorite: !_state.foodList[index].isFavorite);
      }
      return element;
    }).toList();
    _state = _state.copyWith(foodList: foodList);
    notifyListeners();
  }

  void addToCart(Food food) {
    int index = _state.foodList.getIndex(food);

    final List<Food> cartFood = _state.foodList.map((element) {
      if (element.id == food.id) {
        return _state.foodList[index].copyWith(cart: true);
      }
      return element;
    }).toList();

    _state = _state.copyWith(foodList: cartFood);
  }

  String pricePerEachItem(Food food) {
    double price = 0;
    price = food.quantity * food.price;
    return price.toString();
  }

  double get getTotalPrice {
    double totalPrice = 5;
    for (var element in _state.foodList) {
      if (element.cart) {
        totalPrice += element.quantity * element.price;
      }
    }
    return totalPrice;
  }

  get getCartList => _state.foodList.where((element) => element.cart).toList();

  get getFavoriteList =>
      _state.foodList.where((element) => element.isFavorite).toList();
}
