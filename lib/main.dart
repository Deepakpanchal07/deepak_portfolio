import 'package:flutter/material.dart';
import 'constants/app_colors.dart';
import 'constants/app_theme.dart';
import 'sections/about/about_section.dart';
import 'sections/contact/contact_section.dart';
import 'sections/education/education_section.dart';
import 'sections/experience/experience_section.dart';
import 'sections/footer/footer_section.dart';
import 'sections/hero/hero_section.dart';
import 'sections/navbar/mobile_drawer.dart';
import 'sections/navbar/nav_bar.dart';
import 'sections/projects/projects_section.dart';
import 'sections/skills/skills_section.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const DeepakPortfolioApp());
}

class DeepakPortfolioApp extends StatelessWidget {
  const DeepakPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Deepak Panchal | Flutter Developer & Mobile Engineer",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();

  // Section Keys for smooth scrolling
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _educationKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  bool _showBackToTop = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      final show = _scrollController.offset > 400;
      if (show != _showBackToTop) {
        setState(() => _showBackToTop = show);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollTo(GlobalKey key) {
    void executeScroll() {
      final targetContext = key.currentContext;
      if (targetContext != null) {
        Scrollable.ensureVisible(
          targetContext,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOutCubic,
          alignment: 0.02,
        );
      }
    }

    if (key.currentContext != null) {
      executeScroll();
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) => executeScroll());
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.background,
      endDrawer: MobileDrawer(
        onAboutTap: () => _scrollTo(_aboutKey),
        onSkillsTap: () => _scrollTo(_skillsKey),
        onProjectsTap: () => _scrollTo(_projectsKey),
        onExperienceTap: () => _scrollTo(_experienceKey),
        onEducationTap: () => _scrollTo(_educationKey),
        onContactTap: () => _scrollTo(_contactKey),
      ),
      floatingActionButton: _showBackToTop
          ? FloatingActionButton.small(
              backgroundColor: AppColors.accent,
              foregroundColor: Colors.white,
              onPressed: _scrollToTop,
              tooltip: "Scroll to Top",
              child: const Icon(Icons.arrow_upward_rounded),
            )
          : null,
      body: SafeArea(
        child: Column(
          children: [
            // Top Navigation Bar
            NavBar(
              onLogoTap: _scrollToTop,
              onAboutTap: () => _scrollTo(_aboutKey),
              onSkillsTap: () => _scrollTo(_skillsKey),
              onProjectsTap: () => _scrollTo(_projectsKey),
              onExperienceTap: () => _scrollTo(_experienceKey),
              onEducationTap: () => _scrollTo(_educationKey),
              onContactTap: () => _scrollTo(_contactKey),
              onMenuOpen: () => _scaffoldKey.currentState?.openEndDrawer(),
            ),

            // Scrollable Sections
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                physics: const ClampingScrollPhysics(),
                child: Column(
                  children: [
                    HeroSection(
                      sectionKey: _heroKey,
                      onExploreProjects: () => _scrollTo(_projectsKey),
                      onContactTap: () => _scrollTo(_contactKey),
                    ),
                    AboutSection(sectionKey: _aboutKey),
                    SkillsSection(sectionKey: _skillsKey),
                    ProjectsSection(sectionKey: _projectsKey),
                    ExperienceSection(sectionKey: _experienceKey),
                    EducationSection(sectionKey: _educationKey),
                    ContactSection(sectionKey: _contactKey),
                    FooterSection(onBackToTop: _scrollToTop),
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
