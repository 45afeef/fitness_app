import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple, // Total background color is purple
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/logo.png',
                  width: 100,
                  height: 100,
                  color: Colors.purple,
                  colorBlendMode: BlendMode.multiply,
                ), // Logo at the left
                const SizedBox(width: 10), // Spacing between logo and text
                const Text(
                  'Fitness App', // Name at the right
                  style: TextStyle(
                    color: Colors.white, // Text color is white
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text(
                  'Let\'s Get Started', // Text just above the button
                  style: TextStyle(
                    color: Colors.white, // Text color is white
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 20), // Spacing between text and button
                ElevatedButton(
                  onPressed: () {
                    // Handle button press
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.purple,
                    backgroundColor: Colors.white, // Text color is purple
                  ),
                  child: const Text(
                    'SIGN UP OR LOGIN WITH GMAIL',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
