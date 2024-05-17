import 'package:flutter/material.dart';

import '../../widgets/title_with_caption.dart';
import '../home/home_screen.dart';

class BMIScreen extends StatelessWidget {
  const BMIScreen({
    super.key,
    required this.bmi,
  });

  final double bmi;

  @override
  Widget build(BuildContext context) {
    String message = '';

    if (bmi >= 18.5 && bmi <= 25) {
      message = 'Normal';
    } else if (bmi > 25 && bmi <= 30) {
      message = 'Overweight';
    } else if (bmi > 30) {
      message = 'Obesity';
    } else {
      message = 'Underweight';
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Fitness app'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const TitleWithCaption(
                  title: "Your BMI",
                  caption: 'Calculated using your inputs is'),
              Text(
                bmi.toStringAsFixed(2),
                style:
                    const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              Text('Your are $message'),
              const SizedBox(
                height: 100,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const HomePage()));
                },
                child: const Text('View My Recomonded plans'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
