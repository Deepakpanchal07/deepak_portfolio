class ExperienceModel {
  final String role;
  final String company;
  final String location;
  final String period;
  final String typeTag; // e.g. "6-Month Internship" or "Job Simulation"
  final bool isJobSimulation;
  final List<String> responsibilities;
  final List<String> techTags;

  const ExperienceModel({
    required this.role,
    required this.company,
    required this.location,
    required this.period,
    required this.typeTag,
    this.isJobSimulation = false,
    required this.responsibilities,
    required this.techTags,
  });
}
