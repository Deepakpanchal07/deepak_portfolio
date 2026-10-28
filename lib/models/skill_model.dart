import 'package:flutter/material.dart';

class SkillItem {
  final String name;
  final IconData? icon;
  final String? badge;

  const SkillItem({
    required this.name,
    this.icon,
    this.badge,
  });
}

class SkillCategoryModel {
  final String title;
  final IconData icon;
  final String subtitle;
  final List<SkillItem> skills;

  const SkillCategoryModel({
    required this.title,
    required this.icon,
    required this.subtitle,
    required this.skills,
  });
}
