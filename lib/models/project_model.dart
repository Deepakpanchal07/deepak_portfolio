enum ProjectPreviewType {
  foodDelivery,
  easyShopping,
  qrGenerator,
  custom,
}

class ProjectModel {
  final String id;
  final String title;
  final String subtitle;
  final String description;
  final List<String> features;
  final List<String> techTags;
  final String? githubUrl;
  final String? liveDemoUrl;
  final ProjectPreviewType previewType;
  final String? customImageUrl;
  final bool isFeatured;

  const ProjectModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.features,
    required this.techTags,
    this.githubUrl,
    this.liveDemoUrl,
    required this.previewType,
    this.customImageUrl,
    this.isFeatured = true,
  });

  bool get hasValidGithub =>
      githubUrl != null &&
      githubUrl!.isNotEmpty &&
      !githubUrl!.contains('YOUR_') &&
      !githubUrl!.contains('your-username') &&
      !githubUrl!.contains('placeholder');

  bool get hasValidDemo =>
      liveDemoUrl != null &&
      liveDemoUrl!.isNotEmpty &&
      !liveDemoUrl!.contains('YOUR_') &&
      !liveDemoUrl!.contains('demo-link') &&
      !liveDemoUrl!.contains('placeholder') &&
      !liveDemoUrl!.contains('example.com');
}
