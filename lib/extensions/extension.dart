import 'dart:math';

import 'package:flutter/material.dart';

extension MediaQueryExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  double hp(double percentage) => mediaQuery.size.height * (percentage / 100);
  double wp(double percentage) => mediaQuery.size.width * (percentage / 100);
}

Color loadRandomColor() {
  final random = Random();
  return Color.fromARGB(
    255,
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
  );
}
