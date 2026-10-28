import 'package:flutter/material.dart';

class Breakpoints {
  static const double mobileMax = 767.0;
  static const double tabletMin = 768.0;
  static const double desktopMin = 1024.0;
  static const double maxContentWidth = 1200.0;

  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < tabletMin;

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return width >= tabletMin && width < desktopMin;
  }

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= desktopMin;

  static double horizontalPadding(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width < 600) return 20.0;
    if (width < tabletMin) return 28.0;
    if (width < desktopMin) return 40.0;
    return 48.0;
  }
}
