import 'dart:math';

import 'package:fitness_app/features/feed/models/plan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../home/diet_or_workout_details_screen.dart';

class PlanCard extends StatelessWidget {
  final PlanModel model;

  const PlanCard({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsScreen(
                    imageUrl: model.imageUrl,
                    heading: model.heading,
                    description: model.description),
              ));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              ),
              child: Hero(
                tag: 'image-${model.heading}',
                child: Image.network(
                  model.imageUrl,
                  fit: BoxFit.cover,
                  height: 150,
                ),
              ),
            )
                .animate(
                  onPlay: (controller) => controller.repeat(),
                )
                .shimmer(
                    delay: Random().nextInt(5).seconds,
                    duration: Random().nextInt(5).seconds),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: 'heading-${model.heading}',
                    child: Text(model.heading,
                        style: Theme.of(context).textTheme.headlineSmall),
                  ),
                  const SizedBox(height: 8),
                  Hero(
                    tag: 'description-${model.heading}',
                    child: Text(model.description,
                        style: Theme.of(context).textTheme.bodySmall),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
