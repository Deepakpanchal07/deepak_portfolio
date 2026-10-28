import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/app_colors.dart';
import '../../constants/breakpoints.dart';
import '../../data/portfolio_data.dart';
import '../../widgets/animated_button.dart';
import '../../widgets/custom_dialogs.dart';
import '../../widgets/glowing_badge.dart';
import '../../widgets/section_container.dart';
import '../../widgets/social_icon_button.dart';
import 'hero_code_editor_visual.dart';

class HeroSection extends StatelessWidget {
  final GlobalKey sectionKey;
  final VoidCallback onExploreProjects;
  final VoidCallback onContactTap;

  const HeroSection({
    super.key,
    required this.sectionKey,
    required this.onExploreProjects,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = Breakpoints.isDesktop(context);
    final isMobile = Breakpoints.isMobile(context);

    return SectionContainer(
      sectionKey: sectionKey,
      verticalPadding: isMobile ? 40 : 80,
      child: isDesktop ? _buildDesktopLayout(context) : _buildMobileLayout(context),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Left Content Column
        Expanded(
          flex: 6,
          child: _buildTextContent(context, isMobile: false),
        ),
        const SizedBox(width: 48),

        // Right Code Visual Column
        const Expanded(
          flex: 5,
          child: Center(
            child: HeroCodeEditorVisual(),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildTextContent(context, isMobile: true),
        const SizedBox(height: 48),
        const Center(
          child: HeroCodeEditorVisual(),
        ),
      ],
    );
  }

  Widget _buildTextContent(BuildContext context, {required bool isMobile}) {
    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        // Profile Avatar & Availability Badge
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          spacing: 16,
          runSpacing: 12,
          children: [
            GestureDetector(
              onTap: () => CustomDialogs.showImagePreviewModal(
                context,
                imagePath: PortfolioData.profileImagePath,
                title: PortfolioData.name,
                subtitle: PortfolioData.title,
              ),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Container(
                  padding: const EdgeInsets.all(2.5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [AppColors.accent, Color(0xFFFF9E7A)],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.accent.withValues(alpha: 0.45),
                        blurRadius: 18,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      PortfolioData.profileImagePath,
                      width: 56,
                      height: 56,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.person_rounded,
                        size: 32,
                        color: AppColors.accent,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GlowingBadge(
              label: PortfolioData.availabilityStatus,
              dotColor: AppColors.success,
            ),
          ],
        ),
        const SizedBox(height: 24),

        // Greeting
        Text(
          PortfolioData.heroGreeting,
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: GoogleFonts.plusJakartaSans(
            fontSize: isMobile ? 18 : 22,
            fontWeight: FontWeight.w600,
            color: AppColors.accent,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 12),

        // Main Headline with rich gradient
        RichText(
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          text: TextSpan(
            style: GoogleFonts.plusJakartaSans(
              fontSize: isMobile ? 36 : 56,
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimary,
              letterSpacing: -1.2,
              height: 1.1,
            ),
            children: const [
              TextSpan(text: "Building Beautiful "),
              TextSpan(
                text: "Mobile",
                style: TextStyle(
                  color: AppColors.accent,
                ),
              ),
              TextSpan(text: " Experiences with "),
              TextSpan(
                text: "Flutter.",
                style: TextStyle(
                  color: AppColors.accent,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // Short Description
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 580),
          child: Text(
            PortfolioData.heroDescription,
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
            style: GoogleFonts.plusJakartaSans(
              fontSize: isMobile ? 14 : 16,
              color: AppColors.textSecondary,
              height: 1.6,
            ),
          ),
        ),
        const SizedBox(height: 32),

        // CTAs
        Wrap(
          spacing: 16,
          runSpacing: 14,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            AnimatedButton(
              text: "Explore My Projects",
              icon: Icons.arrow_downward_rounded,
              isTrailingIcon: true,
              variant: ButtonVariant.primary,
              height: 52,
              onPressed: onExploreProjects,
            ),
            AnimatedButton(
              text: "Download Resume",
              icon: Icons.download_rounded,
              variant: ButtonVariant.secondary,
              height: 52,
              onPressed: () => CustomDialogs.openResumeDirectly(context),
            ),
          ],
        ),
        const SizedBox(height: 36),

        // Social Icons Bar
        Row(
          mainAxisAlignment:
              isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            Text(
              "CONNECT",
              style: GoogleFonts.jetBrainsMono(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: AppColors.textMuted,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(width: 14),
            SocialIconButton(
              icon: FontAwesomeIcons.linkedinIn,
              tooltip: "LinkedIn Profile",
              onTap: CustomDialogs.launchLinkedIn,
            ),
            const SizedBox(width: 10),
            SocialIconButton(
              icon: FontAwesomeIcons.github,
              tooltip: "GitHub Profile",
              onTap: () {
                CustomDialogs.launchOrShowPlaceholder(
                  context,
                  url: PortfolioData.githubUrl,
                  itemName: "GitHub Profile",
                  configField: "PortfolioData.githubUrl",
                );
              },
            ),
            const SizedBox(width: 10),
            SocialIconButton(
              icon: Icons.email_outlined,
              tooltip: "Send Email",
              onTap: CustomDialogs.launchEmail,
            ),
            const SizedBox(width: 10),
            SocialIconButton(
              icon: Icons.phone_outlined,
              tooltip: "Call: ${PortfolioData.phone}",
              onTap: CustomDialogs.launchPhone,
            ),
          ],
        ),
      ],
    );
  }
}
