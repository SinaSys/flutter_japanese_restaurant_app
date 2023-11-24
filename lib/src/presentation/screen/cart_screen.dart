import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_japanese_restaurant_app/core/app_color.dart';
import 'package:flutter_japanese_restaurant_app/core/app_style.dart';
import 'package:flutter_japanese_restaurant_app/core/app_extension.dart';
import 'package:flutter_japanese_restaurant_app/src/data/model/food.dart';
import 'package:flutter_japanese_restaurant_app/src/presentation/widget/empty_widget.dart';
import 'package:flutter_japanese_restaurant_app/src/presentation/widget/counter_button.dart';
import 'package:flutter_japanese_restaurant_app/src/business_logic/blocs/food/food_bloc.dart';
import 'package:flutter_japanese_restaurant_app/src/business_logic/blocs/theme/theme_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Cart screen",
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final List<Food> cartFood = context.watch<FoodBloc>().getCartList;
    final double totalPrice = context.read<FoodBloc>().getTotalPrice;

    Widget cartListView() {
      return ListView.separated(
        padding: const EdgeInsets.all(30),
        shrinkWrap: true,
        itemCount: cartFood.length,
        itemBuilder: (_, index) {
          return Dismissible(
            onDismissed: (direction) {
              if (direction == DismissDirection.startToEnd) {
                context.read<FoodBloc>().add(RemoveItemEvent(cartFood[index]));
              }
            },
            key: Key(cartFood[index].name),
            background: Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const FaIcon(FontAwesomeIcons.trash),
                ),
              ],
            ),
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: context.read<ThemeBloc>().isLightTheme
                    ? Colors.white
                    : DarkThemeColor.primaryLight,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(width: 20),
                  Image.asset(cartFood[index].image, scale: 10),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cartFood[index].name,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "\$${cartFood[index].price}",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      CounterButton(
                        onIncrementSelected: () => context
                            .read<FoodBloc>()
                            .add(IncreaseQuantityEvent(cartFood[index])),
                        onDecrementSelected: () => context
                            .read<FoodBloc>()
                            .add(DecreaseQuantityEvent(cartFood[index])),
                        size: const Size(24, 24),
                        padding: 0,
                        label: Text(
                          cartFood[index].quantity.toString(),
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                      Text(
                        "\$${context.read<FoodBloc>().pricePerEachItem(cartFood[index])}",
                        style: h2Style.copyWith(color: LightThemeColor.accent),
                      )
                    ],
                  )
                ],
              ),
            ).fadeAnimation(index * 0.6),
          );
        },
        separatorBuilder: (_, __) {
          return const Padding(padding: EdgeInsets.all(10));
        },
      );
    }

    Widget bottomAppBar() {
      return BottomAppBar(
        child: SizedBox(
          height: height * 0.32,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Subtotal",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            "\$${totalPrice - 5}",
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Taxes",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            "\$${5.00}",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(thickness: 4.0, height: 30.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          Text(
                            totalPrice == 5.0 ? "\$0.0" : "\$$totalPrice",
                            style: h2Style.copyWith(
                              color: LightThemeColor.accent,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text("Checkout"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      bottomNavigationBar:
          cartFood.isNotEmpty ? bottomAppBar() : const SizedBox(),
      appBar: _appBar(context),
      body: EmptyWidget(
        title: "Empty cart",
        condition: cartFood.isNotEmpty,
        child: SingleChildScrollView(
          child: SizedBox(height: height * 0.5, child: cartListView()),
        ),
      ),
    );
  }
}
