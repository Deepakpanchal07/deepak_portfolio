import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_colors.dart';
import '../data/portfolio_data.dart';

class CustomDialogs {
  /// Opens a URL safely, or shows placeholder dialog if it's marked as placeholder
  static Future<void> launchOrShowPlaceholder(
    BuildContext context, {
    required String? url,
    required String itemName,
    required String configField,
  }) async {
    if (url == null ||
        url.isEmpty ||
        url.contains('your-username') ||
        url.contains('example.com') ||
        url.contains('placeholder')) {
      showPlaceholderModal(
        context,
        title: "$itemName Link Placeholder",
        message:
            "This link is currently set to a placeholder. You can easily insert your real $itemName URL in your configuration file.",
        configField: configField,
      );
      return;
    }

    final uri = Uri.parse(url);
    try {
      final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!launched) {
        await launchUrl(uri);
      }
    } catch (_) {
      try {
        await launchUrl(uri);
      } catch (_) {
        if (context.mounted) {
          showPlaceholderModal(
            context,
            title: "Unable to Open Link",
            message: "Could not open $url. Please verify the URL formatting.",
            configField: configField,
          );
        }
      }
    }
  }

  /// Directly opens or downloads Deepak Panchal's resume PDF
  static Future<void> openResumeDirectly(BuildContext context) async {
    const urls = [
      'Deepak_Panchal_Resume.pdf',
      'assets/assets/resume/Deepak_Panchal_Resume.pdf',
      'assets/resume/Deepak_Panchal_Resume.pdf',
    ];

    bool launched = false;
    for (final url in urls) {
      try {
        final uri = Uri.parse(url);
        final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
        if (ok) {
          launched = true;
          break;
        }
      } catch (_) {}
    }

    if (!launched) {
      try {
        await launchUrl(
          Uri.parse('Deepak_Panchal_Resume.pdf'),
          mode: LaunchMode.platformDefault,
        );
        launched = true;
      } catch (_) {}
    }

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Opening Deepak Panchal's Resume..."),
          backgroundColor: AppColors.surfaceElevated,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  /// Launch email client directly to Deepak
  static Future<void> launchEmail({String? subject, String? body}) async {
    final queryParams = <String, String>{};
    if (subject != null && subject.isNotEmpty) queryParams['subject'] = subject;
    if (body != null && body.isNotEmpty) queryParams['body'] = body;

    final uri = Uri(
      scheme: 'mailto',
      path: PortfolioData.email,
      queryParameters: queryParams.isNotEmpty ? queryParams : null,
    );

    try {
      final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!launched) {
        await launchUrl(uri);
      }
    } catch (_) {
      try {
        await launchUrl(uri);
      } catch (_) {}
    }
  }

  /// Launch phone dialer directly
  static Future<void> launchPhone() async {
    final uri = Uri.parse("tel:${PortfolioData.phoneRaw}");
    try {
      final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!launched) {
        await launchUrl(uri);
      }
    } catch (_) {
      try {
        await launchUrl(uri);
      } catch (_) {}
    }
  }

  /// Launch LinkedIn profile directly
  static Future<void> launchLinkedIn() async {
    final uri = Uri.parse(PortfolioData.linkedinUrl);
    try {
      final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!launched) {
        await launchUrl(uri);
      }
    } catch (_) {
      try {
        await launchUrl(uri);
      } catch (_) {}
    }
  }

  /// Launch location on Google Maps directly
  static Future<void> launchLocation() async {
    final uri = Uri.parse(
        "https://www.google.com/maps/search/?api=1&query=Hisar,+Haryana,+India");
    try {
      final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!launched) {
        await launchUrl(uri);
      }
    } catch (_) {
      try {
        await launchUrl(uri);
      } catch (_) {}
    }
  }

  /// Displays informative dialog explaining where to update the placeholder
  static void showPlaceholderModal(
    BuildContext context, {
    required String title,
    required String message,
    required String configField,
  }) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: AppColors.border, width: 1.2),
        ),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.accentSubtle,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.code_rounded,
                color: AppColors.accent,
                size: 22,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 14,
                color: AppColors.textSecondary,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "UPDATE IN FILE:",
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: AppColors.accent,
                    ),
                  ),
                  const SizedBox(height: 4),
                  SelectableText(
                    "lib/data/portfolio_data.dart",
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 13,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Field: $configField",
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 12,
                      color: AppColors.textMuted,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(
              "Understood",
              style: GoogleFonts.plusJakartaSans(
                color: AppColors.accent,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Resume download handler and guidance dialog
  static void handleResumeDownload(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: AppColors.border, width: 1.2),
        ),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.accentSubtle,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.description_rounded,
                color: AppColors.accent,
                size: 22,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                "Deepak Panchal's Resume",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "You can download the bundled resume PDF below, or request the latest version directly via email.",
              style: GoogleFonts.plusJakartaSans(
                fontSize: 14,
                color: AppColors.textSecondary,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                children: [
                  const Icon(Icons.picture_as_pdf, color: Colors.redAccent, size: 28),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Deepak_Panchal_Resume.pdf",
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        Text(
                          "assets/resume/Deepak_Panchal_Resume.pdf",
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
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Clipboard.setData(const ClipboardData(text: PortfolioData.email));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Email address copied to clipboard!"),
                  backgroundColor: AppColors.surfaceElevated,
                  duration: Duration(seconds: 2),
                ),
              );
              Navigator.of(ctx).pop();
            },
            child: Text(
              "Copy Email",
              style: GoogleFonts.plusJakartaSans(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.download_rounded, size: 18),
            label: const Text("Open Resume PDF"),
            onPressed: () async {
              Navigator.of(ctx).pop();
              final uri = Uri.parse(PortfolioData.resumePdfPath);
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri);
              } else {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Resume opened from assets. Replace with your actual PDF in assets/resume/ anytime!",
                      ),
                      backgroundColor: AppColors.surfaceElevated,
                    ),
                  );
                }
              }
            },
          ),
        ],
      ),
    );
  }

  /// Displays full-screen or expanded image preview modal with pan & zoom
  static void showImagePreviewModal(
    BuildContext context, {
    required String imagePath,
    required String title,
    String? subtitle,
  }) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.88),
      builder: (ctx) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 860, maxHeight: 760),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.border, width: 1.5),
            boxShadow: [
              BoxShadow(
                color: AppColors.accent.withValues(alpha: 0.2),
                blurRadius: 36,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: AppColors.border),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        color: AppColors.accent,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 12),
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
                          if (subtitle != null)
                            Text(
                              subtitle,
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 12,
                                color: AppColors.accent,
                              ),
                            ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close_rounded, color: AppColors.textSecondary),
                      onPressed: () => Navigator.of(ctx).pop(),
                      splashRadius: 20,
                    ),
                  ],
                ),
              ),

              // Image viewer
              Flexible(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
                  child: InteractiveViewer(
                    maxScale: 4.0,
                    child: Center(
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) => Padding(
                          padding: const EdgeInsets.all(40),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.broken_image_rounded, size: 48, color: AppColors.accent),
                              const SizedBox(height: 12),
                              Text(
                                "Image not found at $imagePath",
                                style: GoogleFonts.plusJakartaSans(color: AppColors.textSecondary),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

