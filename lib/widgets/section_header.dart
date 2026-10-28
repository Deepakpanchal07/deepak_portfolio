import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../constants/breakpoints.dart';

class SectionHeader extends StatelessWidget {
  final String tag;
  final String title;
  final String? highlightedWord;
  final String? subtitle;
  final bool isCentered;

  const SectionHeader({
    super.key,
    required this.tag,
    required this.title,
    this.highlightedWord,
    this.subtitle,
    this.isCentered = false,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = Breakpoints.isMobile(context);

    return Column(
      crossAxisAlignment:
          isCentered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        // Tag Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.accentSubtle,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: AppColors.accent.withValues(alpha: 0.3),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: AppColors.accent,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                tag.toUpperCase(),
                style: GoogleFonts.plusJakartaSans(
                  color: AppColors.accent,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),

        // Main Title
        if (highlightedWord != null && title.contains(highlightedWord!))
          _buildRichTitle(isMobile)
        else
          Text(
            title,
            textAlign: isCentered ? TextAlign.center : TextAlign.start,
            style: GoogleFonts.plusJakartaSans(
              fontSize: isMobile ? 28 : 38,
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimary,
              letterSpacing: -0.8,
              height: 1.2,
            ),
          ),

        // Subtitle
        if (subtitle != null) ...[
          const SizedBox(height: 14),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 680),
            child: Text(
              subtitle!,
              textAlign: isCentered ? TextAlign.center : TextAlign.start,
              style: GoogleFonts.plusJakartaSans(
                fontSize: isMobile ? 14 : 16,
                color: AppColors.textSecondary,
                height: 1.6,
              ),
            ),
          ),
        ],
        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildRichTitle(bool isMobile) {
    final parts = title.split(highlightedWord!);
    return RichText(
      textAlign: isCentered ? TextAlign.center : TextAlign.start,
      text: TextSpan(
        style: GoogleFonts.plusJakartaSans(
          fontSize: isMobile ? 28 : 38,
          fontWeight: FontWeight.w800,
          color: AppColors.textPrimary,
          letterSpacing: -0.8,
          height: 1.2,
        ),
        children: [
          TextSpan(text: parts[0]),
          TextSpan(
            text: highlightedWord,
            style: const TextStyle(
              color: AppColors.accent,
            ),
          ),
          if (parts.length > 1) TextSpan(text: parts[1]),
        ],
      ),
    );
  }
}
