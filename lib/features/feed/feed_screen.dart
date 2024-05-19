import 'package:flutter/material.dart';

import 'widgets/plan_card.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const List planSections = [
      {
        'title': 'Your Recommended Diet',
        'plans': [
          {
            'imageUrl':
                'https://images.unsplash.com/photo-1565895405138-6c3a1555da6a?q=80&w=500',
            'heading': 'Fuel Muscle Growth',
            'description':
                'Boost muscle repair and growth with lean protein sources like chicken, fish, tofu, and legumes.',
          },
          {
            'imageUrl':
                'https://images.unsplash.com/photo-1561043433-aaf687c4cf04?q=80&w=500',
            'heading': 'Fat Loss Strategy',
            'description':
                'Achieve fat loss by reducing carbohydrate intake and increasing healthy fats. Focus on avocados, nuts, and ,',
          },
          {
            'imageUrl':
                'https://images.unsplash.com/photo-1509722747041-616f39b57569?q=80&w=500',
            'heading': 'Heart-Healthy Choices',
            'description':
                'Promote heart health with a diet rich in fruits, vegetables, whole grains, and olive oil. Include fish and ,',
          },
          {
            'imageUrl':
                'https://images.unsplash.com/photo-1556386734-4227a180d19e?q=80&w=500',
            'heading': 'Plant-Powered Eating',
            'description':
                'Embrace plant-based foods by avoiding all animal products. Opt for beans, lentils, nuts, and whole grains.,',
          },
          {
            'imageUrl':
                'https://images.unsplash.com/photo-1551276929-3f75211e0986?q=80&w=500',
            'heading': 'Metabolic Boost',
            'description':
                'Alternate between eating and fasting periods to improve metabolism and promote weight loss.',
          },
        ]
      },
      {
        'title': 'Your Recommended Diet',
        'plans': [
          {
            'imageUrl':
                'https://images.unsplash.com/photo-1584735935682-2f2b69dff9d2?q=80&w=500',
            'heading': 'Build Muscle Power',
            'description':
                'Strengthen your muscles and increase overall strength with weightlifting exercises like squats, deadlifts, ,',
          },
          {
            'imageUrl':
                'https://images.unsplash.com/photo-1518644961665-ed172691aaa1?q=80&w=500',
            'heading': 'Cardiovascular Fitness',
            'description':
                'Improve cardiovascular health with activities like running, cycling, or swimming.',
          },
          {
            'imageUrl':
                'https://plus.unsplash.com/premium_photo-1666736570873-36d95bd8ee3f?q=80&w=500',
            'heading': 'Mind-Body Balance',
            'description':
                'Enhance flexibility, balance, and mental well-being through yoga poses and focused breathing.',
          },
          {
            'imageUrl':
                'https://images.unsplash.com/photo-1521804906057-1df8fdb718b7?q=80&w=500',
            'heading': 'Calorie Burner',
            'description':
                'Burn calories and boost metabolism with short bursts of intense exercise followed by brief rest periods.',
          },
          {
            'imageUrl':
                'https://images.unsplash.com/photo-1434596922112-19c563067271?q=80&w=500',
            'heading': 'Core Strength',
            'description':
                'Strengthen core muscles and improve posture with controlled movements and mindful breathing.',
          },
        ]
      }
    ];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          ...planSections.map(
            (section) => Column(children: [
              const SizedBox(height: 64),
              Text(
                section['title'],
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 24),
              ...section['plans'].map(
                (p) => PlanCard(
                  imageUrl: p['imageUrl'],
                  heading: p['heading'],
                  description: p['description'],
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
