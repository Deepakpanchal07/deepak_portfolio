import 'package:flutter/material.dart';

class HoverBuilder extends StatefulWidget {
  final Widget Function(BuildContext context, bool isHovered) builder;
  final Duration duration;
  final Curve curve;

  const HoverBuilder({
    super.key,
    required this.builder,
    this.duration = const Duration(milliseconds: 200),
    this.curve = Curves.easeOutCubic,
  });

  @override
  State<HoverBuilder> createState() => _HoverBuilderState();
}

class _HoverBuilderState extends State<HoverBuilder> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: widget.builder(context, _isHovered),
    );
  }
}
