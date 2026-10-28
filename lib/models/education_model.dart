class EducationModel {
  final String degree;
  final String institution;
  final String location;
  final String period;
  final String score;
  final String scoreLabel; // e.g., "CGPA" or "Percentage"
  final List<String> highlights;

  const EducationModel({
    required this.degree,
    required this.institution,
    required this.location,
    required this.period,
    required this.score,
    required this.scoreLabel,
    this.highlights = const [],
  });
}
