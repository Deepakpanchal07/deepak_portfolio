import 'package:flutter/material.dart';
import '../constants/breakpoints.dart';

class SectionContainer extends StatelessWidget {
  final Widget child;
  final GlobalKey? sectionKey;
  final double verticalPadding;
  final Color? backgroundColor;
  final bool hasTopDivider;

  const SectionContainer({
    super.key,
    required this.child,
    this.sectionKey,
    this.verticalPadding = 90.0,
    this.backgroundColor,
    this.hasTopDivider = false,
  });

  @override
  Widget build(BuildContext context) {
    final horizontalPad = Breakpoints.horizontalPadding(context);
    final isMobile = Breakpoints.isMobile(context);
    final adjustedVertical = isMobile ? verticalPadding * 0.7 : verticalPadding;

    return Container(
      key: sectionKey,
      width: double.infinity,
      color: backgroundColor,
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: Breakpoints.maxContentWidth),
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPad,
            vertical: adjustedVertical,
          ),
          child: child,
        ),
      ),
    );
  }
}
