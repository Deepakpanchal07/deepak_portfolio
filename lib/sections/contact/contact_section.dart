import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/app_colors.dart';
import '../../constants/breakpoints.dart';
import '../../data/portfolio_data.dart';
import '../../widgets/animated_button.dart';
import '../../widgets/custom_dialogs.dart';
import '../../widgets/glass_card.dart';
import '../../widgets/section_container.dart';
import '../../widgets/section_header.dart';

class ContactSection extends StatefulWidget {
  final GlobalKey sectionKey;

  const ContactSection({super.key, required this.sectionKey});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _handleSendMessage() async {
    if (!_formKey.currentState!.validate()) return;

    final name = _nameController.text.trim();
    final senderEmail = _emailController.text.trim();
    final subject = _subjectController.text.trim().isNotEmpty
        ? _subjectController.text.trim()
        : "Portfolio Contact from $name";
    final message = _messageController.text.trim();

    final fullBody = "Name: $name\nEmail: $senderEmail\n\nMessage:\n$message";

    await CustomDialogs.launchEmail(
      subject: subject,
      body: fullBody,
    );

    if (mounted) {
      _showSentFeedbackDialog(name, senderEmail, subject, message);
    }
  }

  void _showSentFeedbackDialog(
    String name,
    String senderEmail,
    String subject,
    String message,
  ) {
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
                color: AppColors.success.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.mark_email_read_rounded,
                  color: AppColors.success, size: 24),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                "Email Client Ready",
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
              "Your default email client was opened with your message prepared to send to Deepak Panchal (${PortfolioData.email}).",
              style: GoogleFonts.plusJakartaSans(
                fontSize: 14,
                color: AppColors.textSecondary,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "If your email app didn't open automatically, you can copy Deepak's direct email below:",
              style: GoogleFonts.plusJakartaSans(
                fontSize: 13,
                color: AppColors.textMuted,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: SelectableText(
                      PortfolioData.email,
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: 13,
                        color: AppColors.accent,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.copy_rounded, size: 18),
                    color: AppColors.textSecondary,
                    onPressed: () {
                      Clipboard.setData(
                          const ClipboardData(text: PortfolioData.email));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Email address copied!"),
                          backgroundColor: AppColors.surfaceElevated,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              _formKey.currentState?.reset();
              _nameController.clear();
              _emailController.clear();
              _subjectController.clear();
              _messageController.clear();
            },
            child: const Text("Done"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = Breakpoints.isDesktop(context);

    return SectionContainer(
      sectionKey: widget.sectionKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            tag: "Contact",
            title: "Let's Build Something Great Together",
            highlightedWord: "Great Together",
            subtitle:
                "Whether you have an opportunity for a Flutter Developer, a project inquiry, or just want to connect, feel free to reach out.",
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
        // Left Column: Direct Info Cards
        Expanded(
          flex: 5,
          child: _buildContactDetails(context),
        ),
        const SizedBox(width: 48),

        // Right Column: Functional Message Form
        Expanded(
          flex: 6,
          child: _buildContactForm(context),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        _buildContactDetails(context),
        const SizedBox(height: 36),
        _buildContactForm(context),
      ],
    );
  }

  Widget _buildContactDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoCard(
          icon: Icons.email_rounded,
          iconColor: AppColors.accent,
          title: "Email Address",
          value: PortfolioData.email,
          onTap: CustomDialogs.launchEmail,
        ),
        const SizedBox(height: 16),
        _buildInfoCard(
          icon: Icons.phone_rounded,
          iconColor: AppColors.cyanAccent,
          title: "Phone Number",
          value: PortfolioData.phone,
          onTap: CustomDialogs.launchPhone,
        ),
        const SizedBox(height: 16),
        _buildInfoCard(
          icon: Icons.location_on_rounded,
          iconColor: AppColors.success,
          title: "Location (Google Maps)",
          value: PortfolioData.location,
          onTap: CustomDialogs.launchLocation,
        ),
        const SizedBox(height: 16),
        _buildInfoCard(
          icon: FontAwesomeIcons.linkedinIn,
          iconColor: const Color(0xFF0A66C2),
          title: "LinkedIn Profile",
          value: "deepak-panchal-a0aa41362",
          onTap: CustomDialogs.launchLinkedIn,
        ),
        const SizedBox(height: 16),
        _buildInfoCard(
          icon: FontAwesomeIcons.github,
          iconColor: Colors.white,
          title: "GitHub Profile",
          value: "github.com/Deepakpanchal07",
          onTap: () {
            CustomDialogs.launchOrShowPlaceholder(
              context,
              url: PortfolioData.githubUrl,
              itemName: "GitHub Profile",
              configField: "PortfolioData.githubUrl",
            );
          },
        ),
      ],
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String value,
    required VoidCallback? onTap,
  }) {
    return GlassCard(
      padding: const EdgeInsets.all(18),
      borderRadius: 14,
      onTap: onTap,
      enableHoverGlow: onTap != null,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textMuted,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
          if (onTap != null)
            const Icon(
              Icons.arrow_outward_rounded,
              color: AppColors.textMuted,
              size: 16,
            ),
        ],
      ),
    );
  }

  Widget _buildContactForm(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(28),
      borderRadius: 20,
      enableHoverGlow: false,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Send a Direct Message",
              style: GoogleFonts.plusJakartaSans(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              "Fill out this form to open a pre-addressed email in your default mail app.",
              style: GoogleFonts.plusJakartaSans(
                fontSize: 13,
                color: AppColors.textMuted,
              ),
            ),
            const SizedBox(height: 24),

            // Name Field
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "Your Full Name *",
                prefixIcon: Icon(Icons.person_outline_rounded, color: AppColors.textMuted),
              ),
              validator: (val) {
                if (val == null || val.trim().isEmpty) {
                  return "Please enter your name";
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Email Field
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: "Your Email Address *",
                prefixIcon: Icon(Icons.email_outlined, color: AppColors.textMuted),
              ),
              validator: (val) {
                if (val == null || val.trim().isEmpty) {
                  return "Please enter your email";
                }
                if (!val.contains('@') || !val.contains('.')) {
                  return "Please enter a valid email address";
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Subject Field
            TextFormField(
              controller: _subjectController,
              decoration: const InputDecoration(
                labelText: "Subject (Optional)",
                prefixIcon: Icon(Icons.chat_outlined, color: AppColors.textMuted),
              ),
            ),
            const SizedBox(height: 16),

            // Message Field
            TextFormField(
              controller: _messageController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: "Your Message *",
                alignLabelWithHint: true,
                prefixIcon: Padding(
                  padding: EdgeInsets.only(bottom: 60),
                  child: Icon(Icons.message_outlined, color: AppColors.textMuted),
                ),
              ),
              validator: (val) {
                if (val == null || val.trim().isEmpty) {
                  return "Please enter your message";
                }
                return null;
              },
            ),
            const SizedBox(height: 24),

            // Submit Button
            AnimatedButton(
              text: "Send Message via Email",
              icon: Icons.send_rounded,
              isTrailingIcon: true,
              width: double.infinity,
              height: 52,
              onPressed: _handleSendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
