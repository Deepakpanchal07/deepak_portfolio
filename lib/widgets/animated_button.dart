import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

enum ButtonVariant { primary, secondary, outline }

class AnimatedButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool isTrailingIcon;
  final ButtonVariant variant;
  final double? width;
  final double height;
  final double fontSize;
  final EdgeInsetsGeometry? padding;

  const AnimatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.isTrailingIcon = false,
    this.variant = ButtonVariant.primary,
    this.width,
    this.height = 50.0,
    this.fontSize = 15.0,
    this.padding,
  });

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool _isHovered = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final isPrimary = widget.variant == ButtonVariant.primary;
    final isOutline = widget.variant == ButtonVariant.outline;

    Color bgColor;
    Color textColor;
    Border? border;
    List<BoxShadow> shadows = [];

    if (isPrimary) {
      bgColor = _isHovered ? AppColors.accentLight : AppColors.accent;
      textColor = Colors.white;
      if (_isHovered) {
        shadows = [
          BoxShadow(
            color: AppColors.accent.withValues(alpha: 0.4),
            blurRadius: 20,
            offset: const Offset(0, 4),
            spreadRadius: 1,
          ),
        ];
      }
    } else if (isOutline) {
      bgColor = _isHovered ? AppColors.accentSubtle : Colors.transparent;
      textColor = _isHovered ? AppColors.accent : AppColors.textPrimary;
      border = Border.all(
        color: _isHovered ? AppColors.accent : AppColors.border,
        width: 1.2,
      );
    } else {
      // secondary
      bgColor = _isHovered ? AppColors.surfaceElevated : AppColors.surface;
      textColor = _isHovered ? AppColors.textPrimary : AppColors.textSecondary;
      border = Border.all(
        color: _isHovered ? AppColors.accent.withValues(alpha: 0.4) : AppColors.border,
        width: 1.2,
      );
    }

    return MouseRegion(
      cursor: widget.onPressed != null
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          width: widget.width,
          height: widget.height,
          padding: widget.padding ??
              const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          transform: Matrix4.identity()
            ..scale(
              _isPressed
                  ? 0.97
                  : (_isHovered ? 1.02 : 1.0),
            ),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12),
            border: border,
            boxShadow: shadows,
          ),
          child: Row(
            mainAxisSize: widget.width != null ? MainAxisSize.max : MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (widget.icon != null && !widget.isTrailingIcon) ...[
                Icon(widget.icon, size: widget.fontSize + 3, color: textColor),
                const SizedBox(width: 8),
              ],
              Flexible(
                child: Text(
                  widget.text,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: widget.fontSize,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                    letterSpacing: 0.2,
                  ),
                ),
              ),
              if (widget.icon != null && widget.isTrailingIcon) ...[
                const SizedBox(width: 8),
                AnimatedSlide(
                  duration: const Duration(milliseconds: 200),
                  offset: _isHovered ? const Offset(0.15, 0) : Offset.zero,
                  child: Icon(
                    widget.icon,
                    size: widget.fontSize + 3,
                    color: textColor,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
