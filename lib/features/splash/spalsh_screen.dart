import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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
                ),
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
            ).animate().scale(duration: 1.seconds),
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
                StreamBuilder<User?>(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Text(
                        'Authentication Error\nPlease re-install the application',
                        style: TextStyle(color: Colors.white),
                      );
                    }

                    if (snapshot.hasData) {
                      Future.delayed(
                        5.seconds,
                        () => appRouter.go(ScreenPaths.home),
                      );
                      return const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      );
                    }

                    return ElevatedButton(
                      onPressed: () {
                        appRouter.go(ScreenPaths.login);
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.purple,
                        backgroundColor: Colors.white, // Text color is purple
                      ),
                      child: const Text(
                        'SIGN UP OR LOGIN WITH GMAIL',
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
