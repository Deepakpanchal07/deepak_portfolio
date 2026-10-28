import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/app_colors.dart';
import '../../constants/breakpoints.dart';
import '../../data/portfolio_data.dart';
import '../../models/education_model.dart';
import '../../widgets/glass_card.dart';
import '../../widgets/section_container.dart';
import '../../widgets/section_header.dart';

class EducationSection extends StatelessWidget {
  final GlobalKey sectionKey;

  const EducationSection({super.key, required this.sectionKey});

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
            tag: "Academic Background",
            title: "Education & Qualifications",
            highlightedWord: "Qualifications",
            subtitle:
                "Formal academic foundation in Computer Science and Engineering, data structures, and core software engineering principles.",
          ),
          if (isDesktop) _buildDesktopLayout(context) else _buildMobileLayout(context),
          const SizedBox(height: 48),

          // Certifications & Achievements Section
          _buildCertificationsSubSection(context),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Primary Degree Card (Takes wider width)
        Expanded(
          flex: 6,
          child: _buildPrimaryDegreeCard(PortfolioData.educationList[0]),
        ),
        const SizedBox(width: 24),

        // Schooling Cards
        Expanded(
          flex: 5,
          child: Column(
            children: [
              _buildSchoolCard(PortfolioData.educationList[1]),
              const SizedBox(height: 20),
              _buildSchoolCard(PortfolioData.educationList[2]),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        _buildPrimaryDegreeCard(PortfolioData.educationList[0]),
        const SizedBox(height: 20),
        _buildSchoolCard(PortfolioData.educationList[1]),
        const SizedBox(height: 20),
        _buildSchoolCard(PortfolioData.educationList[2]),
      ],
    );
  }

  Widget _buildPrimaryDegreeCard(EducationModel edu) {
    return GlassCard(
      padding: const EdgeInsets.all(28),
      borderRadius: 18,
      borderColor: AppColors.accent.withValues(alpha: 0.4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 12,
            runSpacing: 10,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.accentSubtle,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.school_rounded, color: AppColors.accent, size: 28),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.accentSubtle,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.accent.withValues(alpha: 0.4)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star_rounded, size: 14, color: AppColors.accent),
                    const SizedBox(width: 4),
                    Text(
                      "${edu.scoreLabel}: ${edu.score}",
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: AppColors.accent,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            edu.degree,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimary,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            edu.institution,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.location_on_outlined, size: 14, color: AppColors.textMuted),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  "${edu.location} • ${edu.period}",
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: 12,
                    color: AppColors.textMuted,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(color: AppColors.border, height: 1),
          const SizedBox(height: 16),
          ...edu.highlights.map(
            (h) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Icon(Icons.check_circle_outline_rounded,
                        size: 14, color: AppColors.accent),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      h,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSchoolCard(EducationModel edu) {
    return GlassCard(
      padding: const EdgeInsets.all(20),
      borderRadius: 16,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.surfaceLight,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.history_edu_rounded, color: AppColors.textSecondary, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        edu.degree,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceElevated,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        edu.score,
                        style: GoogleFonts.jetBrainsMono(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: AppColors.accent,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  edu.institution,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "${edu.location} • ${edu.period}",
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: 11,
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCertificationsSubSection(BuildContext context) {
    final isDesktop = Breakpoints.isDesktop(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: AppColors.accentSubtle,
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Icon(Icons.verified_rounded, color: AppColors.accent, size: 18),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                "Certifications & Verified Milestones",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 18),
        if (isDesktop)
          Row(
            children: [
              Expanded(child: _buildCertificationCard(PortfolioData.certifications[0])),
              const SizedBox(width: 20),
              Expanded(child: _buildCertificationCard(PortfolioData.certifications[1])),
            ],
          )
        else
          Column(
            children: [
              _buildCertificationCard(PortfolioData.certifications[0]),
              const SizedBox(height: 16),
              _buildCertificationCard(PortfolioData.certifications[1]),
            ],
          ),
      ],
    );
  }

  Widget _buildCertificationCard(dynamic cert) {
    return GlassCard(
      padding: const EdgeInsets.all(22),
      borderRadius: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 6,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.accentSubtle,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: AppColors.accent.withValues(alpha: 0.3)),
                ),
                child: Text(
                  cert.badgeText,
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: AppColors.accent,
                  ),
                ),
              ),
              Text(
                cert.period,
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 11,
                  color: AppColors.textMuted,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            cert.title,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            cert.issuer,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.accent,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            cert.description,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 13,
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
