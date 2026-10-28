import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/app_colors.dart';
import '../../constants/breakpoints.dart';
import '../../data/portfolio_data.dart';
import '../../widgets/custom_dialogs.dart';
import '../../widgets/glass_card.dart';
import '../../widgets/section_container.dart';
import '../../widgets/section_header.dart';

class AboutSection extends StatelessWidget {
  final GlobalKey sectionKey;

  const AboutSection({super.key, required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    final isDesktop = Breakpoints.isDesktop(context);

    return SectionContainer(
      sectionKey: sectionKey,
      backgroundColor: AppColors.surface.withValues(alpha: 0.3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            tag: "About Me",
            title: "Passionate About Engineering Scalable Mobile Apps",
            highlightedWord: "Scalable Mobile Apps",
            subtitle:
                "Combining strong computer science foundations with hands-on Flutter and Firebase engineering to build engaging digital products.",
          ),
          if (isDesktop) _buildDesktopLayout(context) else _buildMobileLayout(context),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left Column: Profile Photo Card
        SizedBox(
          width: 320,
          child: _buildProfilePhotoCard(context),
        ),
        const SizedBox(width: 40),

        // Right Column: Professional Narrative & Highlights
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBioText(),
              const SizedBox(height: 32),
              _buildHighlightCards(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        _buildProfilePhotoCard(context),
        const SizedBox(height: 32),
        _buildBioText(),
        const SizedBox(height: 32),
        _buildHighlightCards(),
      ],
    );
  }

  Widget _buildProfilePhotoCard(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(16),
      borderRadius: 24,
      enableHoverGlow: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Profile Photo container with glow & zoom tap
          GestureDetector(
            onTap: () => CustomDialogs.showImagePreviewModal(
              context,
              imagePath: PortfolioData.profileImagePath,
              title: PortfolioData.name,
              subtitle: "${PortfolioData.title} • Hisar, India",
            ),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Container(
                      height: 340,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: AppColors.surfaceElevated,
                      ),
                      child: Image.asset(
                        PortfolioData.profileImagePath,
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                        errorBuilder: (context, error, stackTrace) => Container(
                          height: 340,
                          color: AppColors.surfaceElevated,
                          child: const Center(
                            child: Icon(Icons.person, size: 64, color: AppColors.accent),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Dark gradient overlay at bottom
                  Container(
                    height: 110,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(18)),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          AppColors.surface.withValues(alpha: 0.95),
                        ],
                      ),
                    ),
                  ),
                  // Name and status overlay
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          PortfolioData.name,
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Flutter & Mobile Developer",
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.accent,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Tap to expand chip
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: AppColors.background.withValues(alpha: 0.85),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.fullscreen_rounded, size: 14, color: AppColors.accent),
                          const SizedBox(width: 4),
                          Text(
                            "View Photo",
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 11,
                              color: AppColors.textSecondary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Info rows
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.surfaceElevated,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.borderSubtle),
            ),
            child: Column(
              children: [
                _buildPhotoInfoRow(
                  Icons.location_on_rounded,
                  "Location",
                  PortfolioData.location,
                  onTap: CustomDialogs.launchLocation,
                ),
                const Divider(color: AppColors.border, height: 16),
                _buildPhotoInfoRow(Icons.school_rounded, "Degree", "B.Tech CSE '26 (8.07 CGPA)"),
                const Divider(color: AppColors.border, height: 16),
                _buildPhotoInfoRow(Icons.business_center_rounded, "Experience", "Flutter Intern @ QodeMatrix"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoInfoRow(
    IconData icon,
    String label,
    String value, {
    VoidCallback? onTap,
  }) {
    final content = Row(
      children: [
        Icon(icon, size: 16, color: AppColors.accent),
        const SizedBox(width: 10),
        Text(
          "$label: ",
          style: GoogleFonts.plusJakartaSans(
            fontSize: 12,
            color: AppColors.textMuted,
            fontWeight: FontWeight.w500,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 12,
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (onTap != null) ...[
          const SizedBox(width: 4),
          const Icon(Icons.open_in_new_rounded, size: 12, color: AppColors.accent),
        ],
      ],
    );

    if (onTap != null) {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          behavior: HitTestBehavior.opaque,
          child: content,
        ),
      );
    }
    return content;
  }

  Widget _buildBioText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          PortfolioData.aboutBio1,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 16,
            height: 1.7,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          PortfolioData.aboutBio2,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 15,
            height: 1.7,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          PortfolioData.aboutBio3,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 15,
            height: 1.7,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 24),

        // Quick tags
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            _buildBadge("B.Tech CSE Graduate"),
            _buildBadge("QodeMatrix Tech Intern"),
            _buildBadge("Cross-Platform Flutter"),
            _buildBadge("Firebase & REST APIs"),
          ],
        ),
      ],
    );
  }

  Widget _buildBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Text(
        text,
        style: GoogleFonts.plusJakartaSans(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: AppColors.accent,
        ),
      ),
    );
  }

  Widget _buildHighlightCards() {
    return Column(
      children: [
        _buildHighlightCard(
          icon: Icons.school_rounded,
          iconColor: AppColors.cyanAccent,
          title: "B.Tech in Computer Science",
          subtitle: "Om Sterling Global University, Hisar",
          detail: "Graduated with 8.07/10 CGPA. Solid grasp of algorithms, OOP, database design, and network protocols.",
        ),
        const SizedBox(height: 16),
        _buildHighlightCard(
          icon: Icons.work_history_rounded,
          iconColor: AppColors.accent,
          title: "6-Month Flutter Internship",
          subtitle: "QodeMatrix Tech Solutions (Sept 2025 – Feb 2026)",
          detail: "Developed real-world cross-platform apps, Firebase Auth, Firestore integrations, and UI performance tuning.",
        ),
        const SizedBox(height: 16),
        _buildHighlightCard(
          icon: Icons.speed_rounded,
          iconColor: AppColors.success,
          title: "Performance & Responsive UI",
          subtitle: "Mobile-First Design",
          detail: "Crafting fluid 60+ FPS interfaces across Android, iOS, and Web with clean state management and modular architecture.",
        ),
      ],
    );
  }

  Widget _buildHighlightCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String detail,
  }) {
    return GlassCard(
      padding: const EdgeInsets.all(20),
      borderRadius: 16,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.accent,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  detail,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
