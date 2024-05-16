import 'package:flutter/material.dart';

import '../../../presentations/pages/onboarding_survey_screen.dart';
import '../../../presentations/widgets/title_with_caption.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ElevatedButton(
          onPressed: () {
            String email = _emailController.text;
            String password = _passwordController.text;

            if (email.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Please enter the email address')));
            } else if (password.isEmpty || password.length < 8) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                      'Please enter the a valid password of minimum 8 letters')));
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SurveyScreen()));
            }
          },
          child: const Text("Login"),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/2.jpg'),
            opacity: 0.1,
            fit: BoxFit.cover, 
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const TitleWithCaption(
                    title: 'Login', caption: 'Please login to continue'),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.email),
                    title: TextField(
                      controller: _emailController,
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.password),
                    title: TextField(
                      obscureText: true,
                      controller: _passwordController,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
