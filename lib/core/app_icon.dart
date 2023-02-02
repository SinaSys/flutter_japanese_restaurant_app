import 'package:flutter/material.dart';

class AppIcon {
  AppIcon._();

  static const _kFontFam = 'AppIcon';
  static const String? _kFontPkg = null;

  static const IconData heart = IconData(
    0xe801,
    fontFamily: _kFontFam,
    fontPackage: _kFontPkg,
  );

  static const IconData outlinedHeart = IconData(
    0xe802,
    fontFamily: _kFontFam,
    fontPackage: _kFontPkg,
  );
}
