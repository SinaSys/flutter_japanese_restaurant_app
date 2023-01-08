import 'package:flutter/material.dart';
import '../../../../core/app_extension.dart';

import '../../../core/app_color.dart';
import '../../../core/app_style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../business_logic/provider/food/food_provider.dart';
import '../../business_logic/provider/theme/theme_provider.dart';
import '../../data/model/food.dart';
import '../widget/empty_widget.dart';
import '../widget/counter_button.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Cart screen",
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final List<Food> cartFood = context.watch<FoodProvider>().getCartList;
    final double totalPrice = context.read<FoodProvider>().getTotalPrice;

    Widget cartListView() {
      return ListView.separated(
        padding: const EdgeInsets.all(30),
        shrinkWrap: true,
        itemCount: cartFood.length,
        itemBuilder: (_, index) {
          return Dismissible(
            onDismissed: (direction) {
              if (direction == DismissDirection.startToEnd) {
                context.read<FoodProvider>().removeItem(cartFood[index]);
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
                color: context.read<ThemeProvider>().isLightTheme
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
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "\$${cartFood[index].price}",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      CounterButton(
                        onIncrementSelected: () => context
                            .read<FoodProvider>()
                            .increaseQuantity(cartFood[index]),
                        onDecrementSelected: () => context
                            .read<FoodProvider>()
                            .decreaseQuantity(cartFood[index]),
                        size: const Size(24, 24),
                        padding: 0,
                        label: Text(
                          cartFood[index].quantity.toString(),
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                      Text(
                        "\$${context.read<FoodProvider>().pricePerEachItem(cartFood[index])}",
                        style: h2Style.copyWith(color: LightThemeColor.accent),
                      )
                    ],
                  )
                ],
              ),
            ).fadeAnimation(index * 0.6),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Padding(padding: EdgeInsets.all(10));
        },
      );
    }

    Widget _bottomAppBar() {
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
                          Text("Subtotal",
                              style: Theme.of(context).textTheme.headline5),
                          Text("\$${totalPrice - 5}",
                              style: Theme.of(context).textTheme.headline2),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Taxes",
                              style: Theme.of(context).textTheme.headline5),
                          Text("\$${5.00}",
                              style: Theme.of(context).textTheme.headline4),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(
                        thickness: 4.0,
                        height: 30.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total",
                              style: Theme.of(context).textTheme.headline2),
                          Text(
                            totalPrice == 5.0 ? "\$0.0" : "\$$totalPrice",
                            style:
                                h2Style.copyWith(color: LightThemeColor.accent),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.1),
                          child: ElevatedButton(
                              onPressed: () {}, child: const Text("Checkout"))),
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
          cartFood.isNotEmpty ? _bottomAppBar() : const SizedBox(),
      appBar: _appBar(context),
      body: EmptyWidget(
        title: "Empty cart",
        condition: cartFood.isNotEmpty,
        child: SingleChildScrollView(
          child: SizedBox(
            height: height * 0.5,
            child: cartListView(),
          ),
        ),
      ),
    );
  }
}
