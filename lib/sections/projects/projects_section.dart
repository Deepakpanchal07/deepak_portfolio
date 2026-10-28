import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/breakpoints.dart';
import '../../data/portfolio_data.dart';
import '../../widgets/section_container.dart';
import '../../widgets/section_header.dart';
import 'project_card.dart';

class ProjectsSection extends StatelessWidget {
  final GlobalKey sectionKey;

  const ProjectsSection({super.key, required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    final isDesktop = Breakpoints.isDesktop(context);
    final isTablet = Breakpoints.isTablet(context);

    return SectionContainer(
      sectionKey: sectionKey,
      backgroundColor: AppColors.surface.withValues(alpha: 0.25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            tag: "Featured Work",
            title: "Selected Flutter Projects",
            highlightedWord: "Flutter Projects",
            subtitle:
                "Production-focused mobile applications built with Flutter, Firebase, Node.js REST backends, and responsive design systems.",
          ),
          if (isDesktop)
            _buildDesktopGrid()
          else if (isTablet)
            _buildTabletGrid()
          else
            _buildMobileList(),
        ],
      ),
    );
  }

  Widget _buildDesktopGrid() {
    return Column(
      children: [
        // Top 2 projects side by side
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: ProjectCard(project: PortfolioData.projects[0])),
            const SizedBox(width: 24),
            Expanded(child: ProjectCard(project: PortfolioData.projects[1])),
          ],
        ),
        const SizedBox(height: 24),
        // 3rd project centered or full width card
        Row(
          children: [
            Expanded(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800),
                child: ProjectCard(project: PortfolioData.projects[2]),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTabletGrid() {
    return Column(
      children: PortfolioData.projects
          .map((project) => Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: ProjectCard(project: project),
              ))
          .toList(),
    );
  }

  Widget _buildMobileList() {
    return Column(
      children: PortfolioData.projects
          .map((project) => Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: ProjectCard(project: project),
              ))
          .toList(),
    );
  }
}
