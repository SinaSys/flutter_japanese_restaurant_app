import 'package:flutter/material.dart';
import 'package:flutter_japanese_restaurant_app/core/app_asset.dart';
import 'package:flutter_japanese_restaurant_app/src/model/food_category.dart';
import '../src/model/bottom_navigation_item.dart';
import '../src/model/food.dart';

import 'app_icon.dart';

class AppData {
  const AppData._();

  static const dummyText =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

  static List<Food> foodItems = [
    Food(AppAsset.sushi1, "Sushi1", 10.0, 1, false, dummyText, 3.0,
        FoodType.sushi),
    Food(AppAsset.sushi2, "Sushi2", 15.0, 1, false, dummyText, 3.0,
        FoodType.sushi),
    Food(AppAsset.sushi3, "Sushi3", 20.0, 1, false, dummyText, 3.0,
        FoodType.sushi),
    Food(AppAsset.sushi4, "Sushi4", 40.0, 1, false, dummyText, 3.0,
        FoodType.kebab),
    Food(AppAsset.sushi5, "Sushi5", 10.0, 1, false, dummyText, 3.0,
        FoodType.kebab),
    Food(AppAsset.sushi6, "Sushi6", 20.0, 1, false, dummyText, 3.0,
        FoodType.burger),
    Food(AppAsset.sushi7, "Sushi7", 12.0, 1, false, dummyText, 3.0,
        FoodType.burger),
    Food(AppAsset.sushi8, "Sushi8", 30.0, 1, false, dummyText, 3.0,
        FoodType.ramen),
    Food(AppAsset.sushi9, "Sushi9", 10.0, 1, false, dummyText, 3.0,
        FoodType.ramen),
    Food(AppAsset.sushi10, "Sushi10", 15.0, 1, false, dummyText, 3.0,
        FoodType.ramen),
    Food(AppAsset.sushi11, "Sushi11", 25.0, 1, false, dummyText, 3.0,
        FoodType.tempura),
    Food(AppAsset.sushi12, "Sushi12", 20.0, 1, false, dummyText, 3.0,
        FoodType.tempura),
  ];

  static List<BottomNavigationItem> bottomNavigationItems = [
    BottomNavigationItem(
        const Icon(Icons.home_outlined),
        const Icon(Icons.home),
        'Home',
        isSelected: true
    ),
    BottomNavigationItem(
        const Icon(Icons.shopping_cart_outlined),
        const Icon(Icons.shopping_cart),
        'Shopping cart'),
    BottomNavigationItem(
        const  Icon(AppIcon.outlinedHeart),
        const Icon(AppIcon.heart),
        'Favorite'),
    BottomNavigationItem(
        const Icon(Icons.person_outline),
        const Icon(Icons.person),
        'Profile')
  ];

  static List<FoodCategory> categories = [
    FoodCategory(FoodType.all, true),
    FoodCategory(FoodType.sushi, false),
    FoodCategory(FoodType.kebab, false),
    FoodCategory(FoodType.tempura, false),
    FoodCategory(FoodType.ramen, false),
    FoodCategory(FoodType.burger, false),
  ];
}
