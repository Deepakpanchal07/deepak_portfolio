import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/app_colors.dart';

class HeroCodeEditorVisual extends StatefulWidget {
  const HeroCodeEditorVisual({super.key});

  @override
  State<HeroCodeEditorVisual> createState() => _HeroCodeEditorVisualState();
}

class _HeroCodeEditorVisualState extends State<HeroCodeEditorVisual>
    with SingleTickerProviderStateMixin {
  late final AnimationController _floatController;
  late final Animation<double> _floatAnimation;

  @override
  void initState() {
    super.initState();
    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3500),
    )..repeat(reverse: true);

    _floatAnimation = Tween<double>(begin: -8.0, end: 8.0).animate(
      CurvedAnimation(parent: _floatController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _floatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _floatAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _floatAnimation.value),
          child: child,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            // Background Glow
            Positioned(
              child: Container(
                width: 320,
                height: 320,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppColors.accent.withValues(alpha: 0.16),
                      AppColors.cyanAccent.withValues(alpha: 0.05),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),

            // Code Window
            Container(
              constraints: const BoxConstraints(maxWidth: 460),
              width: double.infinity,
              decoration: BoxDecoration(
              color: const Color(0xFF0F131A),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: AppColors.border,
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.6),
                  blurRadius: 32,
                  offset: const Offset(0, 16),
                ),
                BoxShadow(
                  color: AppColors.accent.withValues(alpha: 0.1),
                  blurRadius: 24,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Window Header
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: const BoxDecoration(
                    color: Color(0xFF161B24),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    border: Border(
                      bottom: BorderSide(color: Color(0xFF222836), width: 1),
                    ),
                  ),
                  child: Row(
                    children: [
                      // Window controls
                      _buildWindowDot(const Color(0xFFFF5F56)),
                      const SizedBox(width: 8),
                      _buildWindowDot(const Color(0xFFFFBD2E)),
                      const SizedBox(width: 8),
                      _buildWindowDot(const Color(0xFF27C93F)),
                      const SizedBox(width: 12),
                      // Filename tab
                      Flexible(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFF0F131A),
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: AppColors.border),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.flutter_dash,
                                size: 13,
                                color: AppColors.cyanAccent,
                              ),
                              const SizedBox(width: 6),
                              Flexible(
                                child: Text(
                                  "developer.dart",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.jetBrainsMono(
                                    fontSize: 11,
                                    color: AppColors.textPrimary,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.more_horiz,
                        color: AppColors.textMuted,
                        size: 18,
                      ),
                    ],
                  ),
                ),

                // Editor Body
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildCodeLine(1, [
                        _token("class ", const Color(0xFFFF7B72)),
                        _token("DeepakPanchal ", const Color(0xFF79C0FF)),
                        _token("extends ", const Color(0xFFFF7B72)),
                        _token("FlutterDev ", const Color(0xFFFFA657)),
                        _token("{", AppColors.textPrimary),
                      ]),
                      const SizedBox(height: 6),
                      _buildCodeLine(2, [
                        _token("  final ", const Color(0xFFFF7B72)),
                        _token("degree ", AppColors.textPrimary),
                        _token("= ", const Color(0xFFFF7B72)),
                        _token("'B.Tech CSE - OSGU'", const Color(0xFFA5D6FF)),
                        _token(";", AppColors.textPrimary),
                      ]),
                      const SizedBox(height: 6),
                      _buildCodeLine(3, [
                        _token("  final ", const Color(0xFFFF7B72)),
                        _token("cgpa ", AppColors.textPrimary),
                        _token("= ", const Color(0xFFFF7B72)),
                        _token("8.07", const Color(0xFF79C0FF)),
                        _token(";", AppColors.textPrimary),
                      ]),
                      const SizedBox(height: 6),
                      _buildCodeLine(4, [
                        _token("  final ", const Color(0xFFFF7B72)),
                        _token("internship ", AppColors.textPrimary),
                        _token("= ", const Color(0xFFFF7B72)),
                        _token("'QodeMatrix Tech'", const Color(0xFFA5D6FF)),
                        _token(";", AppColors.textPrimary),
                      ]),
                      const SizedBox(height: 6),
                      _buildCodeLine(5, [
                        _token("  final ", const Color(0xFFFF7B72)),
                        _token("skills ", AppColors.textPrimary),
                        _token("= [", AppColors.textPrimary),
                        _token("'Flutter'", const Color(0xFFFF9E64)),
                        _token(", ", AppColors.textPrimary),
                        _token("'Firebase'", const Color(0xFFFF9E64)),
                        _token(", ", AppColors.textPrimary),
                        _token("'APIs'", const Color(0xFFFF9E64)),
                        _token("];", AppColors.textPrimary),
                      ]),
                      const SizedBox(height: 10),
                      _buildCodeLine(6, [
                        _token("  @override", const Color(0xFFD2A8FF)),
                      ]),
                      const SizedBox(height: 6),
                      _buildCodeLine(7, [
                        _token("  Widget ", const Color(0xFF79C0FF)),
                        _token("build", const Color(0xFFD2A8FF)),
                        _token("(context) => ", AppColors.textPrimary),
                        _token("AwesomeApp", const Color(0xFFFF6B35)),
                        _token("(", AppColors.textPrimary),
                      ]),
                      const SizedBox(height: 6),
                      _buildCodeLine(8, [
                        _token("    responsive: ", const Color(0xFF79C0FF)),
                        _token("true", const Color(0xFFFF7B72)),
                        _token(", highPerformance: ", const Color(0xFF79C0FF)),
                        _token("true", const Color(0xFFFF7B72)),
                        _token(",", AppColors.textPrimary),
                      ]),
                      const SizedBox(height: 6),
                      _buildCodeLine(9, [
                        _token("  );", AppColors.textPrimary),
                      ]),
                      const SizedBox(height: 6),
                      _buildCodeLine(10, [
                        _token("}", AppColors.textPrimary),
                      ]),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Floating Badges around editor
          Positioned(
            top: -18,
            right: -24,
            child: _buildFloatingTag(
              icon: Icons.flutter_dash,
              iconColor: AppColors.cyanAccent,
              title: "Flutter 3.x",
              subtitle: "60+ FPS Native",
            ),
          ),

          Positioned(
            bottom: -22,
            left: -20,
            child: _buildFloatingTag(
              icon: Icons.check_circle_rounded,
              iconColor: AppColors.accent,
              title: "Clean Code",
              subtitle: "GetX • Bloc • REST",
            ),
          ),
        ],
      ),
    ),
  );
}

  Widget _buildWindowDot(Color color) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildCodeLine(int lineNum, List<Widget> tokens) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 22,
          child: Text(
            "$lineNum",
            style: GoogleFonts.jetBrainsMono(
              fontSize: 11,
              color: const Color(0xFF4B5565),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: tokens,
          ),
        ),
      ],
    );
  }

  Widget _token(String text, Color color) {
    return Text(
      text,
      style: GoogleFonts.jetBrainsMono(
        fontSize: 12,
        color: color,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildFloatingTag({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF141822),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.border,
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
          BoxShadow(
            color: iconColor.withValues(alpha: 0.15),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: iconColor, size: 16),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                subtitle,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 10,
                  color: AppColors.textMuted,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
