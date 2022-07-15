# flutter_japanese_restaurant_app

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/2ebc97df65b0461ba42554a2626db9dd)](https://app.codacy.com/gh/SinaSys/flutter_japanese_restaurant_app?utm_source=github.com&utm_medium=referral&utm_content=SinaSys/flutter_japanese_restaurant_app&utm_campaign=Badge_Grade_Settings)

<p align="center">
  <img src="https://img.shields.io/github/workflow/status/SinaSys/flutter_japanese_restaurant_app/Build%20&%20Release">
  <img src="https://img.shields.io/github/v/release/SinaSys/flutter_japanese_restaurant_app?label=Release&logo=semantic-release">
  <img src="https://img.shields.io/github/last-commit/SinaSys/flutter_japanese_restaurant_app?label=Last%20commit">
</p>

Japanese restaurant app is a design implementation of [Japanese restaurant app](https://dribbble.com/shots/14752424-Japan-Restaurant-App-Food-App/attachments/6455673?mode=media) designed by [gandkurniawan](https://dribbble.com/gandkurniawan)

![](https://github.com/SinaSys/flutter_japanese_restaurant_app/blob/master/screenshots/japanese_restaurant_app_dark.png?raw=true)
![](https://github.com/SinaSys/flutter_japanese_restaurant_app/blob/master/screenshots/japanese_restaurant_app_light.png?raw=true)


  <br/>

## GetX | Cubit
There are two different implementations : 1 : GetX version , 2: Cubit version <br/>
• You can access Getx version from ```master branch``` [(here)](https://github.com/SinaSys/flutter_japanese_restaurant_app/tree/master) <br/>
• You can access Cubit version from ```cubit branch``` [(here)](https://github.com/SinaSys/flutter_japanese_restaurant_app/tree/cubit) <br/>

 <br/>

## Screenshots (Light mode)

Preview                    |   Home screen             |  Food Detail Screen    |  Cart Screen
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/SinaSys/flutter_japanese_restaurant_app/blob/master/screenshots/preview.gif?raw=true)|![](https://github.com/SinaSys/flutter_japanese_restaurant_app/blob/master/screenshots/food_list_screen_light.png?raw=true)|![](https://github.com/SinaSys/flutter_japanese_restaurant_app/blob/master/screenshots/food_detail_screen_light.png?raw=true)|![](https://github.com/SinaSys/flutter_japanese_restaurant_app/blob/master/screenshots/cart_screen_light.png?raw=true)

## Screenshots (Dark mode)

Favorite screen            |   Home screen             |  Food Detail Screen       |  Cart Screen
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/SinaSys/flutter_japanese_restaurant_app/blob/master/screenshots/favorite_screen_dark.png?raw=true)|![](https://github.com/SinaSys/flutter_japanese_restaurant_app/blob/master/screenshots/food_list_screen_dark.png?raw=true)|![](https://github.com/SinaSys/flutter_japanese_restaurant_app/blob/master/screenshots/food_detail_screen_dark.png?raw=true)|![](https://github.com/SinaSys/flutter_japanese_restaurant_app/blob/master/screenshots/cart_screen_dark.png?raw=true)


## 🚀 Features :
```
• Dynamically change between light and dark theme
• Bottom navigation animation when switch from one screen to another
• Fade animation for food items in detail screen and list views
• Delete single food item from cart by swipe item to right side
• Automatically delete single item from cart by set its value to zero
• Increase or Decrease quantity for each food item in cart screen
• Display food list on the food list screen
• Display Detail of each food on food detail screen
• Real-time calculation of total price in the cart screen
• Add desired food to the favorite screen
• Select quantity for each item on detail screen
• Filter foods by category
• State management with GetX | Cubit
```



## Directory Structure (GetX version)
```
📂lib
 │───main.dart  
 │───📂core  
 |   │──app_asset.dart
 |   │──app_color.dart
 |   │──app_data.dart
 |   │──app_icon.dart
 |   │──app_style.dart
 |   │──app_theme.dart
 |   └──app_extension.dart
 └───📂src
     │────📂model
     │    │──bottom_navigation_item.dart
     |    │──food.dart
     |    └──food_category.dart
     └────📂view
     |    │───📂screen
     |    |   |──cart_screen.dart
     |    |   |──favorite_screen.dart
     |    |   |──food_detail_screen.dart
     |    |   |──food_list_screen.dart
     |    |   |──home_screen.dart
     |    |   └──profile_screen.dart
     |    │───📂widget
     │    |   |──counter_button.dart
     │    |   |──custom_page_route.dart
     │    |   |──empty_widget.dart
     │    |   |──fade_animation.dart
     │    |   |──food_list_view.dart
     │    |   |──page_transition.dart
     |    |   └──scale_animation.dart
     └────📂controller
          └──food_controller.dart
```


## Directory Structure (Cubit version)
```
📂lib
 │───main.dart  
 │───📂core  
 |   │──app_asset.dart
 |   │──app_color.dart
 |   │──app_data.dart
 |   │──app_icon.dart
 |   │──app_style.dart
 |   │──app_theme.dart
 |   └──app_extension.dart
 └───📂src
     │────📂data
     │    └───📂model
     │        │──bottom_navigation_item.dart
     │        │──food.dart
     │        └──food_category.dart
     └────📂presentation
     |    │───📂screen
     |    |   |──cart_screen.dart
     |    |   |──favorite_screen.dart
     |    |   |──food_detail_screen.dart
     |    |   |──food_list_screen.dart
     |    |   |──home_screen.dart
     |    |   └──profile_screen.dart
     |    │───📂widget
     │    |   |──counter_button.dart
     │    |   |──custom_page_route.dart
     │    |   |──empty_widget.dart
     │    |   |──fade_animation.dart
     |    |   └──food_list_view.dart
     │    │───📂animation
     │    |   |──page_transition.dart
     │    |   └──scale_animation.dart
     └────📂business_logic
          └───📂cubits
              │───📂food
              │   |──food_cubit.dart
              │   └──food_state.dart
              └───📂category
              │    |──category_cubit.dart
              │    └──category_state.dart
              └───📂theme
                   |──theme_cubit.dart
                   └──theme_state.dart
```


## Pull Requests
I welcome and encourage all pull requests. It usually will take me within 48-72 hours to respond to any issue or request.



<br/>

## Dependencies
|       Name      |        Cubit version         |        GetX version        |
| :-------------: | :--------------------------: | :------------------------: |
| [flutter_bloc](https://pub.dev/packages/flutter_bloc)  | ✔️|  ✖️|
| [GetX](https://pub.dev/packages/get)  | ✖️| ✔️|
| [flutter_hooks](https://pub.dev/packages/flutter_hooks)  | ✔️| ✖️|
| [equatable](https://pub.dev/packages/equatable)  | ✔️| ✖️|
| [smooth_page_indicator](https://pub.dev/packages/smooth_page_indicator)  | ✔️| ✔️|
| [flutter_rating_bar](https://pub.dev/packages/flutter_rating_bar)  | ✔️| ✔️|
| [simple_animations](https://pub.dev/packages/simple_animations)  | ✔️|✔️|

  <br/>


## Created & Maintained By

[SinaSys](https://github.com/SinaSys) 



## My other flutter projects
project        |
:-------------------------|
|[Office furniture store app](https://github.com/SinaSys/flutter_office_furniture_store_app)
|[Ecommerce app](https://github.com/SinaSys/flutter_ecommerce_app)
