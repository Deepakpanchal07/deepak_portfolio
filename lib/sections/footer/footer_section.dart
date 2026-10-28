import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/app_colors.dart';
import '../../constants/breakpoints.dart';
import '../../data/portfolio_data.dart';
import '../../widgets/custom_dialogs.dart';

class FooterSection extends StatelessWidget {
  final VoidCallback onBackToTop;

  const FooterSection({super.key, required this.onBackToTop});

  @override
  Widget build(BuildContext context) {
    final isMobile = Breakpoints.isMobile(context);
    final currentYear = DateTime.now().year;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFF07080B),
        border: Border(
          top: BorderSide(color: AppColors.border, width: 1),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: Breakpoints.maxContentWidth),
          child: Column(
            children: [
              // Main row
              if (!isMobile)
                Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 20,
                  runSpacing: 16,
                  children: [
                    _buildBrandInfo(false),
                    _buildSocials(context),
                    _buildBackToTopBtn(),
                  ],
                )
              else
                Column(
                  children: [
                    _buildBrandInfo(true),
                    const SizedBox(height: 20),
                    _buildSocials(context),
                    const SizedBox(height: 24),
                    _buildBackToTopBtn(),
                  ],
                ),
              const SizedBox(height: 32),
              const Divider(color: AppColors.border, height: 1),
              const SizedBox(height: 24),

              // Copyright
              Text(
                "© $currentYear ${PortfolioData.name}. All rights reserved. Built with Flutter Web & Dart.",
                textAlign: TextAlign.center,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 12,
                  color: AppColors.textMuted,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBrandInfo(bool isMobile) {
    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "DP",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary,
                ),
              ),
              const Text(
                ".",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: AppColors.accent,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "|  Deepak Panchal",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            "Flutter Developer • Computer Science Graduate",
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 12,
              color: AppColors.textMuted,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSocials(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(FontAwesomeIcons.linkedinIn, size: 18),
          color: AppColors.textSecondary,
          tooltip: "LinkedIn Profile",
          onPressed: CustomDialogs.launchLinkedIn,
        ),
        const SizedBox(width: 6),
        IconButton(
          icon: const Icon(FontAwesomeIcons.github, size: 18),
          color: AppColors.textSecondary,
          tooltip: "GitHub",
          onPressed: () {
            CustomDialogs.launchOrShowPlaceholder(
              context,
              url: PortfolioData.githubUrl,
              itemName: "GitHub Profile",
              configField: "PortfolioData.githubUrl",
            );
          },
        ),
        const SizedBox(width: 6),
        IconButton(
          icon: const Icon(Icons.email_outlined, size: 20),
          color: AppColors.textSecondary,
          tooltip: "Send Email",
          onPressed: CustomDialogs.launchEmail,
        ),
        const SizedBox(width: 6),
        IconButton(
          icon: const Icon(Icons.phone_outlined, size: 20),
          color: AppColors.textSecondary,
          tooltip: "Call Deepak",
          onPressed: CustomDialogs.launchPhone,
        ),
        const SizedBox(width: 6),
        IconButton(
          icon: const Icon(Icons.description_outlined, size: 20),
          color: AppColors.accent,
          tooltip: "Open Resume (PDF)",
          onPressed: () => CustomDialogs.openResumeDirectly(context),
        ),
      ],
    );
  }

  Widget _buildBackToTopBtn() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onBackToTop,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Back to Top",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(width: 6),
              const Icon(
                Icons.arrow_upward_rounded,
                size: 14,
                color: AppColors.accent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
