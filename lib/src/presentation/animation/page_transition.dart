import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class PageTransition extends StatelessWidget {
  const PageTransition({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PageTransitionSwitcher(
      duration: const Duration(seconds: 1),
      transitionBuilder: (
        Widget child,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return FadeThroughTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        );
      },
      child: child,
    );
  }
}
