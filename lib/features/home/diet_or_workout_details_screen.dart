import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String imageUrl;
  final String heading;
  final String description;

  const DetailsScreen(
      {super.key,
      required this.imageUrl,
      required this.heading,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Hero(
            tag: 'image-$heading',
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                height: 150,
              ),
            ),
          ),
          Hero(
              tag: 'heading-$heading',
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(heading,
                    style: Theme.of(context).textTheme.headlineLarge),
              )),
          const SizedBox(height: 8),
          Hero(
              tag: 'description-$heading',
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(description,
                    style: Theme.of(context).textTheme.bodyLarge),
              )),
        ],
      ),
    );
  }
}
