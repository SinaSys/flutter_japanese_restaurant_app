import 'package:flutter/material.dart';
import '../../../core/app_data.dart';
import 'profile_screen.dart';
import '../animation/page_transition.dart';
import 'cart_screen.dart';
import 'favorite_screen.dart';
import 'food_list_screen.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomeScreen extends HookWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<Widget> screen = [
    const FoodListScreen(),
    const CartScreen(),
    const FavoriteScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    final _selectedIndex = useState(0);

    return Scaffold(
      body: PageTransition(
        child: screen[_selectedIndex.value],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex.value,
        onTap: (int index) {
          _selectedIndex.value = index;
        },
        selectedFontSize: 0,
        items: AppData.bottomNavigationItems.map(
          (element) {
            return BottomNavigationBarItem(
                icon: element.disableIcon,
                label: element.label,
                activeIcon: element.enableIcon);
          },
        ).toList(),
      ),
    );
  }
}
