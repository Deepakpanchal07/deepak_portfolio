import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/app_colors.dart';
import '../../models/project_model.dart';
import '../../widgets/animated_button.dart';
import '../../widgets/custom_dialogs.dart';
import '../../widgets/glass_card.dart';
import 'project_mockup_widgets.dart';

class ProjectCard extends StatefulWidget {
  final ProjectModel project;

  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  late bool _showScreenshot;

  @override
  void initState() {
    super.initState();
    _showScreenshot = widget.project.customImageUrl != null &&
        widget.project.customImageUrl!.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final hasScreenshot = widget.project.customImageUrl != null &&
        widget.project.customImageUrl!.isNotEmpty;

    return GlassCard(
      padding: EdgeInsets.zero,
      enableHoverGlow: true,
      borderRadius: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Visual Showcase Header & Frame
          _buildPreviewWindow(context, hasScreenshot),

          // Content section
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  widget.project.title,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textPrimary,
                    letterSpacing: -0.4,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  widget.project.subtitle,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.accent,
                  ),
                ),
                const SizedBox(height: 14),

                // Description
                Text(
                  widget.project.description,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 14,
                    height: 1.6,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 16),

                // Key Highlights
                Text(
                  "KEY HIGHLIGHTS",
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                    color: AppColors.textMuted,
                  ),
                ),
                const SizedBox(height: 8),
                ...widget.project.features.map(
                  (feature) => Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 4),
                          child: Icon(
                            Icons.check_circle_outline_rounded,
                            size: 14,
                            color: AppColors.accent,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            feature,
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 13,
                              color: AppColors.textPrimary,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 18),

                // Tech tags
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: widget.project.techTags.map((tag) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceElevated,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.borderSubtle),
                      ),
                      child: Text(
                        tag,
                        style: GoogleFonts.jetBrainsMono(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 24),

                // Action Buttons
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    AnimatedButton(
                      text: "GitHub Repository",
                      icon: FontAwesomeIcons.github,
                      height: 42,
                      fontSize: 13,
                      variant: ButtonVariant.secondary,
                      onPressed: () {
                        CustomDialogs.launchOrShowPlaceholder(
                          context,
                          url: widget.project.githubUrl,
                          itemName: "${widget.project.title} GitHub",
                          configField: "projects[...].githubUrl",
                        );
                      },
                    ),
                    AnimatedButton(
                      text: "Live Demo",
                      icon: Icons.open_in_new_rounded,
                      isTrailingIcon: true,
                      height: 42,
                      fontSize: 13,
                      variant: ButtonVariant.outline,
                      onPressed: () {
                        CustomDialogs.launchOrShowPlaceholder(
                          context,
                          url: widget.project.liveDemoUrl,
                          itemName: "${widget.project.title} Demo",
                          configField: "projects[...].liveDemoUrl",
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPreviewWindow(BuildContext context, bool hasScreenshot) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF0C0F14),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Window Control Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 8,
              runSpacing: 6,
              children: [
                // Window dots
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildDot(const Color(0xFFFF5F56)),
                      const SizedBox(width: 6),
                      _buildDot(const Color(0xFFFFBD2E)),
                      const SizedBox(width: 6),
                      _buildDot(const Color(0xFF27C93F)),
                      const SizedBox(width: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: AppColors.borderSubtle),
                        ),
                        child: Text(
                          widget.project.id,
                          style: GoogleFonts.jetBrainsMono(
                            fontSize: 11,
                            color: AppColors.textMuted,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // View Toggle (Screenshot vs Blueprint)
                if (hasScreenshot)
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildToggleButton(
                          label: "Screenshot",
                          icon: Icons.image_rounded,
                          isActive: _showScreenshot,
                          onTap: () => setState(() => _showScreenshot = true),
                        ),
                        const SizedBox(width: 4),
                        _buildToggleButton(
                          label: "Blueprint",
                          icon: Icons.developer_board_rounded,
                          isActive: !_showScreenshot,
                          onTap: () => setState(() => _showScreenshot = false),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),

          // Main Display Area
          if (_showScreenshot && hasScreenshot)
            _buildScreenshotDisplay(context)
          else
            ProjectMockupWidget(type: widget.project.previewType),
        ],
      ),
    );
  }

  Widget _buildDot(Color color) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildToggleButton({
    required String label,
    required IconData icon,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: isActive ? AppColors.accent.withValues(alpha: 0.16) : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: isActive ? AppColors.accent : Colors.transparent,
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 13,
                color: isActive ? AppColors.accent : AppColors.textMuted,
              ),
              const SizedBox(width: 5),
              Text(
                label,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 11,
                  fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                  color: isActive ? AppColors.accent : AppColors.textMuted,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScreenshotDisplay(BuildContext context) {
    return GestureDetector(
      onTap: () => CustomDialogs.showImagePreviewModal(
        context,
        imagePath: widget.project.customImageUrl!,
        title: widget.project.title,
        subtitle: "${widget.project.subtitle} • Tap anywhere to zoom",
      ),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              height: 280,
              width: double.infinity,
              color: const Color(0xFF090B0F),
              padding: const EdgeInsets.all(12),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    widget.project.customImageUrl!,
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                    errorBuilder: (context, error, stackTrace) => Center(
                      child: ProjectMockupWidget(type: widget.project.previewType),
                    ),
                  ),
                ),
              ),
            ),

            // Tap to zoom chip
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.background.withValues(alpha: 0.85),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.border),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.fullscreen_rounded,
                      size: 15,
                      color: AppColors.accent,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "View Fullscreen",
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
