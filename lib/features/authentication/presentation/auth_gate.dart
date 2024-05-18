import 'package:firebase_auth/firebase_auth.dart' hide PhoneAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';

import '../../onboarding/onboarding_screen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return MaterialApp(
            theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.red)),
            home: SignInScreen(
              showAuthActionSwitch: false,
              providers: [
                GoogleProvider(
                    clientId: "AIzaSyB7LvpHUOr8utXvKeF0fYZqCmGTl37tqag"),
              ],
            ),
          );
        }

        return const OnboardingFullScreen();
      },
    );
  }
}
