import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/app_colors.dart';
import '../../constants/breakpoints.dart';
import '../../data/portfolio_data.dart';
import '../../models/skill_model.dart';
import '../../widgets/glass_card.dart';
import '../../widgets/section_container.dart';
import '../../widgets/section_header.dart';

class SkillsSection extends StatelessWidget {
  final GlobalKey sectionKey;

  const SkillsSection({super.key, required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    final isDesktop = Breakpoints.isDesktop(context);
    final isTablet = Breakpoints.isTablet(context);

    int crossAxisCount = 1;
    if (isDesktop) {
      crossAxisCount = 3;
    } else if (isTablet) {
      crossAxisCount = 2;
    }

    return SectionContainer(
      sectionKey: sectionKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            tag: "Technical Stack",
            title: "Skills & Technical Capabilities",
            highlightedWord: "Capabilities",
            subtitle:
                "Focused on cross-platform mobile development, reactive state management, modern cloud databases, and clean architecture.",
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: PortfolioData.skillCategories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              mainAxisExtent: 220,
            ),
            itemBuilder: (context, index) {
              final category = PortfolioData.skillCategories[index];
              return _buildCategoryCard(category);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(SkillCategoryModel category) {
    return GlassCard(
      padding: const EdgeInsets.all(22),
      borderRadius: 16,
      enableHoverGlow: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with icon & title
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.accentSubtle,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(category.icon, color: AppColors.accent, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category.title,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      category.subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 11,
                        color: AppColors.textMuted,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          const Divider(color: AppColors.border, height: 1),
          const SizedBox(height: 16),

          // Skill Pills
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: category.skills.map((skill) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceElevated,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.borderSubtle),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (skill.icon != null) ...[
                          Icon(skill.icon, size: 14, color: AppColors.accent),
                          const SizedBox(width: 6),
                        ],
                        Text(
                          skill.name,
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        if (skill.badge != null) ...[
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                            decoration: BoxDecoration(
                              color: AppColors.accent.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              skill.badge!,
                              style: GoogleFonts.jetBrainsMono(
                                fontSize: 9,
                                color: AppColors.accent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
