import 'package:flutter/material.dart';

extension MediaQueryValues on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.height;
  double get top => MediaQuery.of(this).viewPadding.top;
  double get bottom => MediaQuery.of(this).viewPadding.bottom;
}
