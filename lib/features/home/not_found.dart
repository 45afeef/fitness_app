import 'dart:math';

import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/not_found_${[
            '1.jpg',
            '2.png',
          ][Random().nextInt(2)]}',
          color: Theme.of(context).colorScheme.background,
          colorBlendMode: BlendMode.multiply,
        ),
      ],
    );
  }
}
