import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class SocialIconButton extends StatefulWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;
  final double size;

  const SocialIconButton({
    super.key,
    required this.icon,
    required this.tooltip,
    required this.onTap,
    this.size = 44.0,
  });

  @override
  State<SocialIconButton> createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<SocialIconButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.tooltip,
      waitDuration: const Duration(milliseconds: 300),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: widget.size,
            height: widget.size,
            transform: _isHovered
                ? (Matrix4.identity()..translate(0.0, -3.0, 0.0))
                : Matrix4.identity(),
            decoration: BoxDecoration(
              color: _isHovered ? AppColors.accent : AppColors.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: _isHovered ? AppColors.accent : AppColors.border,
                width: 1.2,
              ),
              boxShadow: [
                if (_isHovered)
                  BoxShadow(
                    color: AppColors.accent.withValues(alpha: 0.35),
                    blurRadius: 14,
                    offset: const Offset(0, 4),
                  ),
              ],
            ),
            child: Center(
              child: Icon(
                widget.icon,
                size: widget.size * 0.44,
                color: _isHovered ? Colors.white : AppColors.textSecondary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
