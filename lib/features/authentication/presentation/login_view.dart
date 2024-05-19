import 'package:fitness_app/features/authentication/presentation/auth_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 150, 12, 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Hello 👋',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ).animate().fade(delay: 300.milliseconds),
            Text(
              'Welcom back, You have been missed during this time',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.black,
                  ),
            )
                .animate()
                .fade(delay: 600.milliseconds)
                .slideY(begin: 1, delay: 600.milliseconds),
            CustomTextField(
              emailController: emailController,
              labelText: "Your Email Address",
              prefixIcon: const Icon(Icons.email_rounded),
            )
                .animate()
                .fade(delay: 700.milliseconds)
                .slideY(begin: 1, delay: 700.milliseconds),
            CustomTextField(
              emailController: passwordController,
              labelText: "Password",
              prefixIcon: const Icon(Icons.security),
            )
                .animate()
                .fade(delay: 800.milliseconds)
                .slideY(begin: 1, delay: 800.milliseconds),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                minimumSize: const Size(260, 40),
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginView(),
                    ));
              },
              child: const Text('Login Now'),
            )
                .animate()
                .fade(delay: 700.milliseconds)
                .slideY(begin: 1, delay: 700.milliseconds),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Expanded(
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                ).animate().scaleX(delay: 1.seconds),
                const Gap(12),
                const Icon(
                  Icons.star_border_purple500_rounded,
                  color: Colors.grey,
                ).animate().scale(delay: 1200.milliseconds),
                const Gap(12),
                const Text('OR').animate().fade(delay: 1.seconds),
                const Gap(12),
                const Icon(
                  Icons.star_border_purple500_rounded,
                  color: Colors.grey,
                ).animate().scale(delay: 800.milliseconds),
                const Gap(12),
                Expanded(
                  child: const Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ).animate().scaleX(delay: 1.seconds),
                ),
              ],
            ),
            SocialButton(
              onPressed: () {},
              child: Image.asset(
                'assets/images/google.png',
                width: 24,
                height: 24,
              ),
            )
                .animate()
                .fade(delay: 1.5.seconds)
                .slideY(begin: 1, delay: 1.5.seconds),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.emailController,
    required this.labelText,
    this.prefixIcon,
  });

  final TextEditingController emailController;
  final String labelText;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: emailController,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.grey, width: 1.0),
        ),
      ),
    );
  }
}
