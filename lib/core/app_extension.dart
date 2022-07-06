import 'package:flutter/material.dart';
import 'package:flutter_japanese_restaurant_app/src/view/widget/fade_animation.dart';

extension IterableWithIndex<T> on Iterable<T> {
  Iterable<E> mapWithIndex<E>(E Function(int index, T value) f) {
    return Iterable.generate(length).map((i) => f(i, elementAt(i)));
  }

  Iterable<T> distinctBy(Object Function(T e) getCompareValue) {
    var result = <T>[];
    forEach(
      (element) {
        if (!result
            .any((x) => getCompareValue(x) == getCompareValue(element))) {
          result.add(element);
        }
      },
    );
    return result;
  }
}

extension EnumExtension<T> on List<T> {
  List<String> toListString() {
    List<String> list = <String>[];
    List<String> stringWithDotSeparator = <String>[];
    stringWithDotSeparator = map((element) => element.toString()).toList();
    for (int i = 0; i < length; i++) {
      list.add(stringWithDotSeparator[i].split(".").last);
    }
    return list;
  }
}

extension ListExtension on List<String> {
  List<String> toCapital() {
    List<String> capitalList = [];
    for (var i = 0; i < length; ++i) {
      capitalList
          .add(this[i][0].toUpperCase() + this[i].substring(1, this[i].length));
    }
    return capitalList;
  }
}

extension StringExtension on String {
  String get toCapital => this[0].toUpperCase() + substring(1, length);
}

extension WidgetExtension on Widget {
  Widget fadeAnimation(double delay) {
    return FadeAnimation(delay: delay, child: this);
  }
}
