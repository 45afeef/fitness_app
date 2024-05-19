import 'package:email_validator/email_validator.dart';
import 'package:fitness_app/features/authentication/presentation/auth_view.dart';
import 'package:fitness_app/features/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoging = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 150, 12, 12),
        child: Form(
          key: formKey,
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
              ),
              Text(
                'Welcom back, You have been missed during this time',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.black,
                    ),
              ),
              CustomTextField(
                  enabled: !isLoging,
                  emailController: emailController,
                  labelText: "Your Email Address",
                  prefixIcon: const Icon(Icons.email_rounded),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Please enter an email address';
                    } else if (!EmailValidator.validate(value!)) {
                      return 'Enter a valid email address';
                    }
                    return null; // Valid email
                  }),
              CustomTextField(
                enabled: !isLoging,
                emailController: passwordController,
                labelText: "Password",
                obsureText: true,
                prefixIcon: const Icon(Icons.security),
                validator: (value) {
                  if (value != null && value.length < 8) {
                    return 'Password should have 8 character';
                  }
                  return null; // Valid password
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  minimumSize: const Size(260, 40),
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                onPressed: isLoging
                    ? null
                    : () {
                        if (formKey.currentState != null &&
                            formKey.currentState!.validate()) {
                          final email = emailController.text;
                          final password = passwordController.text;

                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Loging in...')));

                          setState(() {
                            isLoging = true;
                          });

                          Future.delayed(const Duration(seconds: 5), () {
                            setState(() {
                              isLoging = false;
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const OnboardingFullScreen()),
                            );
                          });
                        }
                      },
                child: isLoging
                    ? const SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.black,
                        ),
                      )
                    : const Text('Login Now'),
              ),
              const Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  ),
                  Gap(12),
                  Icon(
                    Icons.star_border_purple500_rounded,
                    color: Colors.grey,
                  ),
                  Gap(12),
                  Text('OR'),
                  Gap(12),
                  Icon(
                    Icons.star_border_purple500_rounded,
                    color: Colors.grey,
                  ),
                  Gap(12),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
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
              ),
            ],
          ),
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
    this.obsureText = false,
    this.validator,
    this.enabled = true,
  });

  final TextEditingController emailController;
  final String labelText;
  final Widget? prefixIcon;
  final bool obsureText;
  final String? Function(String?)? validator;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      validator: validator,
      obscureText: obsureText,
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
