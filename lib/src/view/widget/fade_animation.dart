import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';


enum AniProps { opacity, translateY }

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  const FadeAnimation({Key? key ,required this.delay, required  this.child}):super(key: key);


  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<AniProps>()
      ..add(AniProps.opacity, Tween<double>(begin: 0.0, end: 1.0), const Duration(milliseconds: 500))
      ..add(AniProps.translateY, Tween<double>(begin: -30.0, end: 0.0), const Duration(milliseconds: 500),
          Curves.easeOut);


    return PlayAnimation<MultiTweenValues<AniProps>>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, child, value) => Opacity(
        opacity: value.get(AniProps.opacity),
        child: Transform.translate(
            offset: Offset(0, value.get(AniProps.translateY),), child: child),
      ),
    );
  }
}