import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/app_colors.dart';
import '../../data/portfolio_data.dart';
import '../../widgets/animated_button.dart';
import '../../widgets/custom_dialogs.dart';

class MobileDrawer extends StatelessWidget {
  final VoidCallback onAboutTap;
  final VoidCallback onSkillsTap;
  final VoidCallback onProjectsTap;
  final VoidCallback onExperienceTap;
  final VoidCallback onEducationTap;
  final VoidCallback onContactTap;

  const MobileDrawer({
    super.key,
    required this.onAboutTap,
    required this.onSkillsTap,
    required this.onProjectsTap,
    required this.onExperienceTap,
    required this.onEducationTap,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.background,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textPrimary,
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
                  IconButton(
                    icon: const Icon(Icons.close_rounded, color: AppColors.textPrimary),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Profile Mini Header
              Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.accent, width: 2),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        PortfolioData.profileImagePath,
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                        errorBuilder: (context, error, stackTrace) => const Icon(
                          Icons.person,
                          size: 24,
                          color: AppColors.accent,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          PortfolioData.name,
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        Text(
                          "Flutter Developer",
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 12,
                            color: AppColors.accent,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Divider(color: AppColors.border),
              const SizedBox(height: 16),

              // Navigation links
              _buildMobileItem(context, "About", Icons.person_outline_rounded, onAboutTap),
              _buildMobileItem(context, "Skills", Icons.bolt_rounded, onSkillsTap),
              _buildMobileItem(context, "Projects", Icons.code_rounded, onProjectsTap),
              _buildMobileItem(context, "Experience", Icons.work_outline_rounded, onExperienceTap),
              _buildMobileItem(context, "Education", Icons.school_outlined, onEducationTap),
              _buildMobileItem(context, "Contact", Icons.mail_outline_rounded, onContactTap),

              const Spacer(),

              // Download Resume button
              AnimatedButton(
                text: "Download Resume",
                icon: Icons.download_rounded,
                width: double.infinity,
                variant: ButtonVariant.secondary,
                onPressed: () {
                  Navigator.of(context).pop();
                  CustomDialogs.openResumeDirectly(context);
                },
              ),
              const SizedBox(height: 12),

              // Let's Talk CTA
              AnimatedButton(
                text: "Let's Talk",
                icon: Icons.chat_bubble_outline_rounded,
                width: double.infinity,
                variant: ButtonVariant.primary,
                onPressed: () {
                  Navigator.of(context).pop();
                  Future.delayed(const Duration(milliseconds: 200), onContactTap);
                },
              ),
              const SizedBox(height: 20),

              // Social Icons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.linkedinIn, size: 20),
                    color: AppColors.textSecondary,
                    tooltip: "LinkedIn Profile",
                    onPressed: CustomDialogs.launchLinkedIn,
                  ),
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.github, size: 20),
                    color: AppColors.textSecondary,
                    tooltip: "GitHub Profile",
                    onPressed: () {
                      CustomDialogs.launchOrShowPlaceholder(
                        context,
                        url: PortfolioData.githubUrl,
                        itemName: "GitHub Profile",
                        configField: "PortfolioData.githubUrl",
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.email_outlined, size: 22),
                    color: AppColors.textSecondary,
                    tooltip: "Send Email",
                    onPressed: CustomDialogs.launchEmail,
                  ),
                  IconButton(
                    icon: const Icon(Icons.phone_outlined, size: 22),
                    color: AppColors.textSecondary,
                    tooltip: "Call Deepak",
                    onPressed: CustomDialogs.launchPhone,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMobileItem(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap,
  ) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: AppColors.accent, size: 20),
      title: Text(
        title,
        style: GoogleFonts.plusJakartaSans(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
      ),
      trailing: const Icon(
        Icons.chevron_right_rounded,
        color: AppColors.textMuted,
        size: 18,
      ),
      onTap: () {
        Navigator.of(context).pop();
        Future.delayed(const Duration(milliseconds: 200), onTap);
      },
    );
  }
}
