import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_japanese_restaurant_app/src/controller/food_controller.dart';
import 'package:flutter_japanese_restaurant_app/src/view/screen/home_screen.dart';

final FoodController controller = Get.put(FoodController());

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: controller.theme.value,
        home: HomeScreen(),
      );
    });
  }
}
