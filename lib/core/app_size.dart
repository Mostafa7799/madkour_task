import 'package:flutter/material.dart';

class AppSize {
  static final size =
      MediaQueryData.fromView(WidgetsBinding.instance.window).size;
  static final width = size.width;
  static final height = size.height;
}
