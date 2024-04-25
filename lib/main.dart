import 'package:fitness_app/presentations/pages/onboarding_survey_screen.dart';
import 'package:flutter/material.dart';

import 'presentations/widgets/title_with_caption.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Fitness app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
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
                      builder: (context) => const OnboardingSurveyScreen()));
            }
          },
          child: const Text("Login"),
        ),
      ),
    );
  }
}
