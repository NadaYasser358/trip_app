// lib/onboarding/widgets/onboarding_page_content.dart

import 'package:flutter/material.dart';
import 'package:graduation/view/screens/auth/login.dart';


class OnboardingPageContent extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final String imagePath;
  final PageController controller;
  final bool showButtons;
  final bool isLastPage;

  const OnboardingPageContent({
    super.key,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.imagePath,
    required this.controller,
    required this.showButtons,
    required this.isLastPage,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(16),
            height: 280,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(title,
                    style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                if (subtitle.isNotEmpty)
                  Text(subtitle,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                const SizedBox(height: 10),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14),
                ),
                const Spacer(),
                if (showButtons)
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey,
                            shape: const StadiumBorder(),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (_) => const LoginScreen()),
                            );
                          },
                          child: const Text("Skip", style: TextStyle(fontSize: 16)),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigoAccent,
                            shape: const StadiumBorder(),
                          ),
                          onPressed: () {
                            controller.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: const Text("Next", style: TextStyle(fontSize: 16)),
                        ),
                      ),
                    ],
                  ),
                if (isLastPage)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigoAccent,
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginScreen()),
                      );
                    },
                    child: const Text("Get Started", style: TextStyle(fontSize: 16)),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
