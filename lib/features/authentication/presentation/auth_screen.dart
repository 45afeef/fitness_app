import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            'https://img.freepik.com/free-vector/training-home-concept_23-2148479237.jpg',
            color: Theme.of(context).colorScheme.background,
            colorBlendMode: BlendMode.multiply,
          ).animate().fade(),
          Text(
            'Welcome!',
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ).animate().fade(delay: 300.milliseconds),
          const Gap(12),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: 'Connect with us and explore all the \n',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.black38),
                children: <TextSpan>[
                  TextSpan(
                    text: "excellent benifits",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.amber[700]),
                  ),
                  const TextSpan(
                    text: " of proper workout",
                  ),
                ]),
          ).animate().fade(delay: 500.milliseconds),
          const Gap(60),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              minimumSize: const Size(260, 40),
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
            ),
            onPressed: () {},
            child: const Text('Login'),
          ).animate().fade(delay: 700.milliseconds),
          TextButton(
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                foregroundColor: Colors.black,
                minimumSize: const Size(260, 40)),
            onPressed: () {},
            child: const Text('Sign Up'),
          ).animate().fade(delay: 900.milliseconds),
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
          const Gap(16),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialButton(
                onPressed: () {},
                child: Image.asset(
                  'assets/images/google.png',
                  width: 24,
                  height: 24,
                ),
              ).animate().fade(delay: 1.5.seconds),
            ],
          ),
        ],
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  final void Function()? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 2.0,
      fillColor: Colors.white,
      padding: const EdgeInsets.all(15.0),
      shape: const CircleBorder(), // Set the background color
      child: child,
    );
  }
}
