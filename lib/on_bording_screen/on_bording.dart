import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'onbordingpage.firs.sec.dart';
import 'onbordingpage.third.dart';

class on_bording extends StatefulWidget {
  on_bording({super.key});

  @override
  State<on_bording> createState() => _on_bordingState();
}

class _on_bordingState extends State<on_bording> {
  final next = PageController();

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: PageView(
            controller: next,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            children: [
              onbordingpagefirssec(
                  "Trip Minder",
                  "Smart travel, Made simple!",
                  "From planning to exploring, Travel Minder makes every step of your adventure seamless and unforgettable.",
                  "assets/images/onbording1.png",
                  next,
                  currentPage),
              onbordingpagefirssec(
                  "Keep Your Budget in Check",
                  "",
                  "Discover, plan, and set off on an unforgettable journey using our travel app. Easily track and manage your trip expenses with real-time insights.",
                  "assets/images/onbording2.png",
                  next,
                  currentPage),
              onbordingpagethird(
                "Ready?!",
                "Your next adventure a click away",
                "Discover, plan, and set off on an unforgettable journey using our travel app. Easily track and manage your trip expenses with real-time insights.",
                "assets/images/onboarding3 .png",
                next,
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
