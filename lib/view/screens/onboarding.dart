// lib/onboarding/onboarding_screen.dart

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:graduation/view/widgets/onboarding_page_content.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      OnboardingPageContent(
        title: "Trip Minder",
        subtitle: "Smart travel, Made simple!",
        description:
            "From planning to exploring, Trip Minder makes every step of your adventure seamless and unforgettable.",
        imagePath: "assets/appIntro/onboarding1.png",
        controller: _pageController,
        showButtons: true,
        isLastPage: false,
      ),
      OnboardingPageContent(
        title: "Keep Your Budget in Check",
        subtitle: "",
        description:
            "Discover, plan, and set off on an unforgettable journey using our travel app. Easily track and manage your trip expenses with real-time insights.",
        imagePath: "assets/appIntro/onboarding2.png",
        controller: _pageController,
        showButtons: true,
        isLastPage: false,
      ),
      OnboardingPageContent(
        title: "Ready?!",
        subtitle: "Your next adventure a click away",
        description:
            "Discover, plan, and set off on an unforgettable journey using our travel app. Easily track and manage your trip expenses with real-time insights.",
        imagePath: "assets/appIntro/onboarding3.png",
        controller: _pageController,
        showButtons: false,
        isLastPage: true,
      ),
    ];

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) => setState(() => _currentPage = index),
              children: pages,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: SmoothPageIndicator(
              controller: _pageController,
              count: pages.length,
              effect: const ExpandingDotsEffect(
                dotHeight: 10,
                dotWidth: 10,
                activeDotColor: Colors.indigoAccent,
                dotColor: Colors.black26,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
