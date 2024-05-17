import 'package:flutter/material.dart';

import '../authentication/presentation/login.dart';

class OnboardingFullScreen extends StatefulWidget {
  const OnboardingFullScreen({super.key});

  @override
  State<OnboardingFullScreen> createState() => _OnboardingFullScreenState();
}

class OnboardingItem {
  final String image;
  final String title;
  final String description;

  OnboardingItem(
      {required this.image, required this.title, required this.description});
}

class _OnboardingFullScreenState extends State<OnboardingFullScreen> {
  static final List<OnboardingItem> items = [
    OnboardingItem(
        image: 'assets/images/1.jpg',
        title: 'Welcome to Your Health Journey!',
        description:
            'Start your path to a healthier you with personalized nutrition and fitness tracking.'),
    OnboardingItem(
        image: 'assets/images/2.jpg',
        title: 'Eat Smart, Live Strong',
        description:
            'Discover nutritious meal plans tailored just for you and track your daily intake effortlessly.'),
    OnboardingItem(
        image: 'assets/images/3.jpg',
        title: 'Your Fitness Companion',
        description:
            'Set and achieve your fitness goals with custom workout suggestions and progress monitoring.'),
    OnboardingItem(
        image: 'assets/images/4.jpg',
        title: 'Nutrition Insights',
        description:
            'Get detailed analysis of your eating habits and learn how to fuel your body the right way.'),
    OnboardingItem(
        image: 'assets/images/5.jpg',
        title: 'Stay Motivated',
        description:
            'Receive daily motivation and tips to keep you on track with your health and fitness journey.'),
  ];

  int currentItemIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar:
          true, // Ensures the body extends behind where the AppBar would be
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(items[currentItemIndex].image),
            fit: BoxFit.cover, // Covers the entire widget area
          ),
        ),
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                items[currentItemIndex].title,
                style: const TextStyle(fontSize: 56, color: Colors.white),
              ),
              const SizedBox(height: 10),
              Text(
                items[currentItemIndex].description,
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...List.generate(
                      items.length,
                      (index) => Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              height: 10,
                              width: index == currentItemIndex ? 40 : 10,
                              decoration: const BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: const AnimatedSwitcher(
                                  duration: Duration.zero),
                            ),
                          )),
                  const Spacer(),
                  ElevatedButton(
                      onPressed: () {
                        if (currentItemIndex + 1 < items.length) {
                          setState(() {
                            currentItemIndex++;
                          });
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ));
                        }
                      },
                      child: const Text("Next"))
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        )),
      ),
    );
  }
}
