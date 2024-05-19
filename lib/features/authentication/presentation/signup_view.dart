import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart' hide AuthProvider;
import 'package:fitness_app/features/authentication/presentation/login_view.dart';
import 'package:fitness_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoging = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Spacer(),
              Text(
                'Welcome 👋 \nSign Up now ',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const Gap(40),
              Text(
                'You are one step away from the fit future. \nSign up now and enjoy the happines of fit life',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.black,
                    ),
              ),
              const Gap(40),
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
              const Gap(10),
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
              const Gap(40),
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
                    : () async {
                        if (formKey.currentState != null &&
                            formKey.currentState!.validate()) {
                          final email = emailController.text;
                          final password = passwordController.text;

                          setState(() {
                            isLoging = true;
                          });

                          final authProvider =
                              Provider.of<AuthProvider>(context, listen: false);

                          try {
                            final credentials = await authProvider
                                .handSignUpEmail(email, password);

                            if (credentials.user != null) {
                              setState(() {
                                isLoging = false;
                              });
                              clearAndNavigate(context, ScreenPaths.intro);
                            }
                          } on FirebaseAuthException catch (e) {
                            print(e);
                            ScaffoldMessenger.of(context)
                                .removeCurrentSnackBar();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                '${e.message}',
                                style: const TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.red,
                            ));
                            setState(() {
                              isLoging = false;
                            });
                          } catch (e) {
                            ScaffoldMessenger.of(context)
                                .removeCurrentSnackBar();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                e.toString(),
                                style: const TextStyle(color: Colors.black),
                              ),
                              backgroundColor: Colors.amber,
                            ));
                            setState(() {
                              isLoging = false;
                            });
                          }
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
                    : const Text('Sign Up'),
              ),
              const Spacer(),
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
