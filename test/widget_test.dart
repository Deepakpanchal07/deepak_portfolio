import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:deepak_portfolio/main.dart';
import 'package:deepak_portfolio/sections/navbar/nav_bar.dart';
import 'package:deepak_portfolio/sections/hero/hero_section.dart';

void main() {
  testWidgets('Portfolio loads properly on desktop', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1280, 900);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const DeepakPortfolioApp());
    await tester.pump();

    // Verify key sections and widgets load
    expect(find.byType(NavBar), findsOneWidget);
    expect(find.byType(HeroSection), findsOneWidget);
    expect(find.text("Hi, I'm Deepak Panchal."), findsOneWidget);
    expect(find.text("Explore My Projects"), findsOneWidget);
    expect(find.text("Download Resume"), findsWidgets);
  });

  testWidgets('Portfolio loads properly on mobile viewport', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const DeepakPortfolioApp());
    await tester.pump();

    // Verify mobile hamburger menu icon is displayed
    expect(find.byIcon(Icons.menu_rounded), findsOneWidget);
    expect(find.text("Hi, I'm Deepak Panchal."), findsOneWidget);
  });

  testWidgets('Portfolio renders cleanly at 360px small mobile', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(360, 780);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const DeepakPortfolioApp());
    await tester.pump();
    expect(find.byIcon(Icons.menu_rounded), findsOneWidget);
  });

  testWidgets('Portfolio renders cleanly at 768px tablet portrait', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(768, 1024);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const DeepakPortfolioApp());
    await tester.pump();
    expect(find.byIcon(Icons.menu_rounded), findsOneWidget);
  });

  testWidgets('Portfolio renders cleanly at 1440px desktop widescreen', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1440, 900);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const DeepakPortfolioApp());
    await tester.pump();
    expect(find.text("Let's Talk"), findsOneWidget);
  });
}
