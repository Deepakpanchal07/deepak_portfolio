import 'package:flutter/material.dart';
import '../models/project_model.dart';
import '../models/experience_model.dart';
import '../models/education_model.dart';
import '../models/certification_model.dart';
import '../models/skill_model.dart';

/// Centralized configuration for all portfolio content.
/// Deepak can easily customize his URLs, resume path, and projects here.
class PortfolioData {
  // ===========================================================================
  // 1. PERSONAL INFORMATION & LINKS
  // ===========================================================================
  static const String name = "Deepak Panchal";
  static const String initials = "DP";
  static const String title = "Flutter Developer | Mobile App Developer";
  static const String location = "Hisar, Haryana, India";
  static const String email = "pnchaldeepak82@gmail.com";
  static const String phone = "+91 8816039384";
  static const String phoneRaw = "+918816039384";
  
  // Confirmed LinkedIn profile
  static const String linkedinUrl = "https://www.linkedin.com/in/deepak-panchal-a0aa41362/";
  
  // Confirmed GitHub profile
  static const String githubUrl = "https://github.com/Deepakpanchal07";
  static const bool isGithubPlaceholder = false;

  // EDITABLE: Path to your profile picture in assets/images/
  static const String profileImagePath = "assets/images/profile.jpg";

  // EDITABLE: Path to your actual resume in assets/resume/
  static const String resumePdfPath = "assets/resume/Deepak_Panchal_Resume.pdf";

  // Availability status badge
  static const String availabilityStatus = "Open to Opportunities";

  // Hero Section texts
  static const String heroGreeting = "Hi, I'm Deepak Panchal.";
  static const String heroHeadline = "Building Beautiful Mobile Experiences with Flutter.";
  static const String heroDescription =
      "I'm a Computer Science and Engineering graduate passionate about building cross-platform mobile applications with Flutter and Dart. I have hands-on experience with Firebase, REST APIs, state management, and payment gateway integration. I enjoy creating responsive, user-friendly interfaces and maintainable applications.";

  // About Me professional biography
  static const String aboutBio1 =
      "I am a Computer Science and Engineering graduate from Om Sterling Global University, Hisar (CGPA 8.07/10), passionate about engineering intuitive, highly responsive mobile apps.";
  static const String aboutBio2 =
      "Recently, I completed a six-month Flutter Developer internship at QodeMatrix Tech Solutions, Gurugram (September 2025 – February 2026), where I worked extensively on production-oriented Flutter features, Firebase services, state management, and UI performance optimization.";
  static const String aboutBio3 =
      "I focus on writing clean, modular Dart code, integrating reliable REST APIs and payment gateways, and delivering seamless user experiences across mobile and web.";

  // ===========================================================================
  // 2. TECHNICAL SKILLS CATEGORIES (Verified only - no invented percentages)
  // ===========================================================================
  static final List<SkillCategoryModel> skillCategories = [
    SkillCategoryModel(
      title: "Mobile Development",
      icon: Icons.phone_android_rounded,
      subtitle: "Core mobile app frameworks & architecture",
      skills: const [
        SkillItem(name: "Flutter", icon: Icons.flutter_dash, badge: "Primary"),
        SkillItem(name: "Android", icon: Icons.android, badge: "Native Basics"),
      ],
    ),
    SkillCategoryModel(
      title: "Programming Languages",
      icon: Icons.code_rounded,
      subtitle: "Languages for application logic & algorithms",
      skills: const [
        SkillItem(name: "Dart", icon: Icons.code, badge: "Core"),
        SkillItem(name: "C", icon: Icons.terminal),
        SkillItem(name: "Python", icon: Icons.data_object),
      ],
    ),
    SkillCategoryModel(
      title: "Backend & Database",
      icon: Icons.storage_rounded,
      subtitle: "Server logic, cloud services & databases",
      skills: const [
        SkillItem(name: "Node.js", icon: Icons.dns_rounded),
        SkillItem(name: "MongoDB", icon: Icons.table_chart_rounded),
        SkillItem(name: "Firebase Auth", icon: Icons.security_rounded),
        SkillItem(name: "Cloud Firestore", icon: Icons.cloud_done_rounded),
      ],
    ),
    SkillCategoryModel(
      title: "State Management",
      icon: Icons.alt_route_rounded,
      subtitle: "Scalable reactive app state architecture",
      skills: const [
        SkillItem(name: "GetX", icon: Icons.flash_on_rounded),
        SkillItem(name: "Bloc", icon: Icons.architecture_rounded),
        SkillItem(name: "Cubit", icon: Icons.view_quilt_rounded),
      ],
    ),
    SkillCategoryModel(
      title: "APIs & Integrations",
      icon: Icons.sync_alt_rounded,
      subtitle: "Network protocols & payment infrastructure",
      skills: const [
        SkillItem(name: "REST APIs", icon: Icons.http_rounded),
        SkillItem(name: "Razorpay Gateway", icon: Icons.payment_rounded),
      ],
    ),
    SkillCategoryModel(
      title: "Tools & Workflow",
      icon: Icons.handyman_rounded,
      subtitle: "Development environments & productivity",
      skills: const [
        SkillItem(name: "Git", icon: Icons.commit_rounded),
        SkillItem(name: "GitHub", icon: Icons.folder_shared_rounded),
        SkillItem(name: "VS Code", icon: Icons.integration_instructions_rounded),
        SkillItem(name: "Android Studio", icon: Icons.developer_mode_rounded),
        SkillItem(name: "Figma", icon: Icons.design_services_rounded),
        SkillItem(name: "Antigravity", icon: Icons.auto_awesome_rounded),
      ],
    ),
  ];

  // ===========================================================================
  // 3. FEATURED PROJECTS (Exact 3 projects - Task Management App removed)
  // ===========================================================================
  static final List<ProjectModel> projects = [
    const ProjectModel(
      id: "food-delivery",
      title: "Food Delivery App",
      subtitle: "Full-Stack Food Ordering & Restaurant Discovery Platform",
      description:
          "Developed a food delivery application using Flutter for the frontend and Node.js, Express.js, and MongoDB for the backend, providing restaurant browsing, menu discovery, cart management, and order placement.",
      features: [
        "Restaurant listings and categorized menu browsing",
        "Secure user authentication and profile management",
        "Dynamic add-to-cart with price calculations & checkout",
        "Backend REST API integration for orders and menus",
        "Restaurant and food item management capabilities",
      ],
      techTags: [
        "Flutter",
        "Dart",
        "Node.js",
        "Express.js",
        "MongoDB",
        "REST APIs",
      ],
      githubUrl: "https://github.com/Deepakpanchal07/food-delivery-app",
      liveDemoUrl: "https://demo.food-delivery-app.example.com",
      previewType: ProjectPreviewType.foodDelivery,
      customImageUrl: "assets/images/projects/food_delivery.png",
      isFeatured: true,
    ),
    const ProjectModel(
      id: "easy-shopping",
      title: "Easy Shopping – E-Commerce Application",
      subtitle: "Cross-Platform Retail Store with Payments & Cloud Backend",
      description:
          "Developed a cross-platform e-commerce application using Flutter and Firebase, featuring product listings, cart management, orders, reviews, and payment functionality.",
      features: [
        "Firebase Authentication and real-time Cloud Firestore sync",
        "Razorpay payment gateway integration for seamless transactions",
        "Real-time order tracking and dynamic product catalog updates",
        "Responsive user interface optimized for 60+ FPS mobile performance",
      ],
      techTags: [
        "Flutter",
        "Dart",
        "Firebase",
        "Cloud Firestore",
        "Razorpay",
      ],
      githubUrl: "https://github.com/Deepakpanchal07/easy-shopping",
      liveDemoUrl: "https://demo.easy-shopping.example.com",
      previewType: ProjectPreviewType.easyShopping,
      customImageUrl: "assets/images/projects/easy_shopping.png",
      isFeatured: true,
    ),
    const ProjectModel(
      id: "qr-generator",
      title: "QR Generator",
      subtitle: "Utility App for Instant QR Code Generation & Customization",
      description:
          "Developed a Flutter application for generating QR codes with a clean, user-friendly interface.",
      features: [
        "Instant QR code generation for text, URLs, contacts & WiFi",
        "Clean, minimalistic user interface with live preview",
        "Fast client-side rendering with export & sharing options",
        "Optimized layout across diverse mobile screen aspect ratios",
      ],
      techTags: [
        "Flutter",
        "Dart",
        "QR Generation",
      ],
      githubUrl: "https://github.com/Deepakpanchal07/qr_generator",
      liveDemoUrl: "https://demo.qr-generator.example.com",
      previewType: ProjectPreviewType.qrGenerator,
      customImageUrl: "assets/images/projects/qr_generator.png",
      isFeatured: true,
    ),
  ];

  // ===========================================================================
  // 4. INTERNSHIP & EXPERIENCE (Accurate verified records only)
  // ===========================================================================
  static final List<ExperienceModel> experiences = [
    const ExperienceModel(
      role: "Flutter Developer Intern",
      company: "QodeMatrix Tech Solutions",
      location: "Gurugram, Haryana",
      period: "September 2025 – February 2026",
      typeTag: "6-Month Internship",
      isJobSimulation: false,
      responsibilities: [
        "Developed cross-platform mobile applications using Flutter and Dart.",
        "Integrated Firebase Authentication and Cloud Firestore for robust cloud backend data sync.",
        "Improved UI performance and fixed functional and interface bugs across diverse device sizes.",
        "Worked on real-world application development and production-oriented features.",
      ],
      techTags: [
        "Flutter",
        "Dart",
        "Firebase Auth",
        "Cloud Firestore",
        "UI Optimization",
        "Debugging",
      ],
    ),
    const ExperienceModel(
      role: "Software Engineering Job Simulation",
      company: "Skyscanner, Forage",
      location: "Remote",
      period: "June 2025",
      typeTag: "Job Simulation",
      isJobSimulation: true,
      responsibilities: [
        "Completed an intensive software engineering job simulation focused on industry microservices.",
        "Developed a basic web application with REST API integration.",
        "Implemented a Dropwizard microservice for car rental and hotel search/booking workflows using REST endpoints.",
        "Worked on an Android flight-itinerary application using the Backpack SDK, including API calls and data parsing.",
      ],
      techTags: [
        "Android",
        "Java",
        "Dropwizard",
        "Backpack SDK",
        "REST APIs",
        "Microservices",
      ],
    ),
  ];

  // ===========================================================================
  // 5. EDUCATION TIMELINE (Accurate verified scores)
  // ===========================================================================
  static final List<EducationModel> educationList = [
    const EducationModel(
      degree: "B.Tech in Computer Science and Engineering",
      institution: "Om Sterling Global University",
      location: "Hisar, Haryana",
      period: "2022 – 2026",
      score: "8.07 / 10",
      scoreLabel: "CGPA",
      highlights: [
        "Core subjects: Data Structures, Algorithms, DBMS, Operating Systems, Computer Networks",
        "Specialized interest in Mobile Application Engineering & Cloud Backends",
      ],
    ),
    const EducationModel(
      degree: "Class 12 (Senior Secondary)",
      institution: "Shivalik Sr. Secondary School",
      location: "Haryana",
      period: "2022",
      score: "70%",
      scoreLabel: "Score",
      highlights: [
        "Science Stream (Physics, Chemistry, Mathematics)",
      ],
    ),
    const EducationModel(
      degree: "Class 10 (Secondary)",
      institution: "Shaheed Bhagat Singh High School",
      location: "Haryana",
      period: "2020",
      score: "89%",
      scoreLabel: "Score",
      highlights: [
        "Distinction in Mathematics and Science",
      ],
    ),
  ];

  // ===========================================================================
  // 6. CERTIFICATIONS & ACHIEVEMENTS (No invented items)
  // ===========================================================================
  static final List<CertificationModel> certifications = [
    const CertificationModel(
      title: "Artificial Intelligence Certificate Course",
      issuer: "ICT Academy, Infosys Foundation",
      period: "Certified",
      description:
          "Completed comprehensive course covering foundational concepts of Artificial Intelligence, machine learning principles, and modern computing paradigms.",
      badgeText: "AI Foundation",
    ),
    const CertificationModel(
      title: "Six-Month Flutter Developer Internship",
      issuer: "QodeMatrix Tech Solutions",
      period: "Sept 2025 – Feb 2026",
      description:
          "Successfully completed 6-month hands-on industrial internship developing cross-platform Flutter applications, Firebase integration, and UI optimization.",
      badgeText: "Industry Experience",
    ),
  ];
}
