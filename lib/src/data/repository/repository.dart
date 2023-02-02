import 'package:flutter_japanese_restaurant_app/core/app_asset.dart';
import 'package:flutter_japanese_restaurant_app/src/data/model/food.dart';
import 'package:flutter_japanese_restaurant_app/src/data/model/food_category.dart';

class Repository {
  get getFoodList {
    const dummyText =
        "Lorem Ipsum is simply dummy text of the printing and typesetting "
        "industry. Lorem Ipsum has been the industry's standard dummy text ever "
        "since the 1500s, when an unknown printer took a galley of type and "
        "scrambled it to make a type specimen book. It has survived not only five "
        "centuries, but also the leap into electronic typesetting, remaining "
        "essentially unchanged. It was popularised in the 1960s with the release "
        "of Letraset sheets containing Lorem Ipsum passages, and more recently "
        "with desktop publishing software like Aldus PageMaker including versions "
        "of Lorem Ipsum.";

    const List<Food> foodItems = [
      Food(
          id: 1,
          image: AppAsset.sushi1,
          name: "Sushi1",
          price: 10.0,
          description: dummyText,
          score: 5.0,
          type: FoodType.sushi,
          voter: 150),
      Food(
          id: 2,
          image: AppAsset.sushi2,
          name: "Sushi2",
          price: 15.0,
          description: dummyText,
          score: 3.5,
          type: FoodType.sushi,
          voter: 652),
      Food(
          id: 3,
          image: AppAsset.sushi3,
          name: "Sushi3",
          price: 20.0,
          description: dummyText,
          score: 4.0,
          type: FoodType.sushi,
          voter: 723),
      Food(
          id: 4,
          image: AppAsset.sushi4,
          name: "Sushi4",
          price: 40.0,
          description: dummyText,
          score: 2.5,
          type: FoodType.kebab,
          voter: 456),
      Food(
          id: 5,
          image: AppAsset.sushi5,
          name: "Sushi5",
          price: 10.0,
          description: dummyText,
          score: 4.5,
          type: FoodType.kebab,
          voter: 650),
      Food(
          id: 6,
          image: AppAsset.sushi6,
          name: "Sushi6",
          price: 20.0,
          description: dummyText,
          score: 1.5,
          type: FoodType.burger,
          voter: 350),
      Food(
          id: 7,
          image: AppAsset.sushi7,
          name: "sushi7",
          price: 12.0,
          description: dummyText,
          score: 3.5,
          type: FoodType.burger,
          voter: 265),
      Food(
          id: 8,
          image: AppAsset.sushi8,
          name: "sushi8",
          price: 30.0,
          description: dummyText,
          score: 4.0,
          type: FoodType.ramen,
          voter: 890),
      Food(
          id: 9,
          image: AppAsset.sushi9,
          name: "sushi9",
          price: 10.0,
          description: dummyText,
          score: 5.0,
          type: FoodType.ramen,
          voter: 900),
      Food(
          id: 10,
          image: AppAsset.sushi10,
          name: "sushi10",
          price: 15.0,
          description: dummyText,
          score: 3.5,
          type: FoodType.ramen,
          voter: 420),
      Food(
          id: 11,
          image: AppAsset.sushi11,
          name: "sushi11",
          price: 25.0,
          description: dummyText,
          score: 3.0,
          type: FoodType.tempura,
          voter: 263),
      Food(
          id: 12,
          image: AppAsset.sushi12,
          name: "sushi12",
          price: 20.0,
          description: dummyText,
          score: 5.0,
          type: FoodType.tempura,
          voter: 560),
    ];

    return foodItems;
  }

  get getCategories {
    const List<FoodCategory> categories = [
      FoodCategory(type: FoodType.all, isSelected: true),
      FoodCategory(type: FoodType.sushi, isSelected: false),
      FoodCategory(type: FoodType.kebab, isSelected: false),
      FoodCategory(type: FoodType.tempura, isSelected: false),
      FoodCategory(type: FoodType.ramen, isSelected: false),
      FoodCategory(type: FoodType.burger, isSelected: false),
    ];

    return categories;
  }
}
