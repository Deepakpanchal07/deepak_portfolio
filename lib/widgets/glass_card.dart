import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class GlassCard extends StatefulWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double borderRadius;
  final VoidCallback? onTap;
  final bool enableHoverGlow;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? width;
  final double? height;

  const GlassCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(24),
    this.margin,
    this.borderRadius = 16.0,
    this.onTap,
    this.enableHoverGlow = true,
    this.backgroundColor,
    this.borderColor,
    this.width,
    this.height,
  });

  @override
  State<GlassCard> createState() => _GlassCardState();
}

class _GlassCardState extends State<GlassCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isInteractive = widget.onTap != null || widget.enableHoverGlow;

    return MouseRegion(
      onEnter: isInteractive ? (_) => setState(() => _isHovered = true) : null,
      onExit: isInteractive ? (_) => setState(() => _isHovered = false) : null,
      cursor: widget.onTap != null ? SystemMouseCursors.click : MouseCursor.defer,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOutCubic,
          width: widget.width,
          height: widget.height,
          margin: widget.margin,
          padding: widget.padding,
          transform: _isHovered && widget.enableHoverGlow
              ? (Matrix4.identity()..translate(0.0, -4.0, 0.0))
              : Matrix4.identity(),
          decoration: BoxDecoration(
            color: widget.backgroundColor ??
                (_isHovered && widget.enableHoverGlow
                    ? AppColors.surfaceLight
                    : AppColors.surface),
            borderRadius: BorderRadius.circular(widget.borderRadius),
            border: Border.all(
              color: _isHovered && widget.enableHoverGlow
                  ? (widget.borderColor ?? AppColors.accent.withValues(alpha: 0.5))
                  : (widget.borderColor ?? AppColors.border),
              width: 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.4),
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
              if (_isHovered && widget.enableHoverGlow)
                BoxShadow(
                  color: AppColors.accent.withValues(alpha: 0.12),
                  blurRadius: 24,
                  offset: const Offset(0, 4),
                  spreadRadius: 2,
                ),
            ],
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
