import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/app_colors.dart';
import '../../constants/breakpoints.dart';
import '../../data/portfolio_data.dart';
import '../../widgets/animated_button.dart';

class NavBar extends StatelessWidget {
  final VoidCallback onAboutTap;
  final VoidCallback onSkillsTap;
  final VoidCallback onProjectsTap;
  final VoidCallback onExperienceTap;
  final VoidCallback onEducationTap;
  final VoidCallback onContactTap;
  final VoidCallback onLogoTap;
  final VoidCallback onMenuOpen;

  const NavBar({
    super.key,
    required this.onAboutTap,
    required this.onSkillsTap,
    required this.onProjectsTap,
    required this.onExperienceTap,
    required this.onEducationTap,
    required this.onContactTap,
    required this.onLogoTap,
    required this.onMenuOpen,
  });

  @override
  Widget build(BuildContext context) {
    final showDesktopNav = MediaQuery.sizeOf(context).width >= 1024;
    final horizontalPad = Breakpoints.horizontalPadding(context);

    return Container(
      width: double.infinity,
      height: 76,
      decoration: BoxDecoration(
        color: AppColors.background.withValues(alpha: 0.92),
        border: const Border(
          bottom: BorderSide(color: AppColors.border, width: 1),
        ),
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: Breakpoints.maxContentWidth),
          padding: EdgeInsets.symmetric(horizontal: horizontalPad),
          child: Row(
            children: [
              // Logo "DP." with Avatar
              _buildLogo(),
              const SizedBox(width: 16),

              // Desktop Navigation Links or Mobile Hamburger
              if (showDesktopNav) ...[
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildNavLink("About", onAboutTap),
                          _buildNavLink("Skills", onSkillsTap),
                          _buildNavLink("Projects", onProjectsTap),
                          _buildNavLink("Experience", onExperienceTap),
                          _buildNavLink("Education", onEducationTap),
                          _buildNavLink("Contact", onContactTap),
                          const SizedBox(width: 12),
                          AnimatedButton(
                            text: "Let's Talk",
                            icon: Icons.chat_bubble_outline_rounded,
                            height: 40,
                            fontSize: 13,
                            onPressed: onContactTap,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ] else ...[
                const Spacer(),
                // Mobile Hamburger
                IconButton(
                  icon: const Icon(
                    Icons.menu_rounded,
                    color: AppColors.textPrimary,
                    size: 28,
                  ),
                  onPressed: onMenuOpen,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onLogoTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.accent, width: 1.5),
                ),
                child: ClipOval(
                  child: Image.asset(
                    PortfolioData.profileImagePath,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.person,
                      size: 16,
                      color: AppColors.accent,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Padding(
                padding: const EdgeInsets.only(right: 6),
                child: RichText(
                  text: TextSpan(
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                      letterSpacing: -0.5,
                    ),
                    children: const [
                      TextSpan(text: "DP"),
                      TextSpan(
                        text: ".",
                        style: TextStyle(color: AppColors.accent),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavLink(String label, VoidCallback onTap) {
    return _NavLinkItem(label: label, onTap: onTap);
  }
}

class _NavLinkItem extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const _NavLinkItem({required this.label, required this.onTap});

  @override
  State<_NavLinkItem> createState() => _NavLinkItemState();
}

class _NavLinkItemState extends State<_NavLinkItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: Text(
            widget.label,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: _isHovered ? AppColors.accent : AppColors.textSecondary,
              letterSpacing: 0.2,
            ),
          ),
        ),
      ),
    );
  }
}
