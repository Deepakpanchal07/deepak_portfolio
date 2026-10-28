import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/app_colors.dart';
import '../../data/portfolio_data.dart';
import '../../models/experience_model.dart';
import '../../widgets/glass_card.dart';
import '../../widgets/section_container.dart';
import '../../widgets/section_header.dart';

class ExperienceSection extends StatelessWidget {
  final GlobalKey sectionKey;

  const ExperienceSection({super.key, required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      sectionKey: sectionKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            tag: "Work Experience",
            title: "Internship & Practical Experience",
            highlightedWord: "Practical Experience",
            subtitle:
                "Hands-on industry experience building production features with Flutter, Firebase, and backend API microservices.",
          ),
          ...PortfolioData.experiences.map((exp) => _buildExperienceCard(context, exp)),
        ],
      ),
    );
  }

  Widget _buildExperienceCard(BuildContext context, ExperienceModel exp) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: GlassCard(
        padding: const EdgeInsets.all(18),
        borderRadius: 18,
        enableHoverGlow: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Role and Type Badge
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 10,
              runSpacing: 6,
              children: [
                Text(
                  exp.role,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textPrimary,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: exp.isJobSimulation
                        ? const Color(0xFF1E293B)
                        : AppColors.accentSubtle,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: exp.isJobSimulation
                          ? AppColors.border
                          : AppColors.accent.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Text(
                    exp.typeTag,
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: exp.isJobSimulation
                          ? AppColors.cyanAccent
                          : AppColors.accent,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Company, Location, and Period Chips
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 10,
              runSpacing: 8,
              children: [
                _buildInfoBadge(Icons.business_rounded, exp.company),
                _buildInfoBadge(Icons.location_on_outlined, exp.location),
                _buildInfoBadge(Icons.calendar_today_rounded, exp.period),
              ],
            ),
            const SizedBox(height: 20),
            const Divider(color: AppColors.border, height: 1),
            const SizedBox(height: 18),

            // Responsibilities List
            ...exp.responsibilities.map((resp) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 6),
                      child: Icon(
                        Icons.arrow_right_rounded,
                        color: AppColors.accent,
                        size: 18,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        resp,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 14,
                          color: AppColors.textSecondary,
                          height: 1.6,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
            const SizedBox(height: 14),

            // Tech Tags
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: exp.techTags.map((tag) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceElevated,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: AppColors.borderSubtle),
                  ),
                  child: Text(
                    tag,
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 11,
                      color: AppColors.textSecondary,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoBadge(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: AppColors.accent),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              label,
              style: GoogleFonts.jetBrainsMono(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
