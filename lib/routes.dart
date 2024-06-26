import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/features/authentication/presentation/auth_view.dart';
import 'package:fitness_app/features/home/home_screen.dart';
import 'package:fitness_app/features/onboarding/onboarding_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenPaths {
  static const String splash = '/';
  static const String login = '/login';
  static const String intro = '/intro';
  static const String home = '/home';
}

final appRouter = GoRouter(
  routes: [
    AppRoute(
        ScreenPaths.splash,
        (_) => FirebaseAuth.instance.currentUser != null
            ? const HomePage()
            : const AuthScreen()),
    AppRoute(ScreenPaths.login, (s) => const AuthScreen()),
    AppRoute(ScreenPaths.intro, (s) => const OnboardingFullScreen()),
    AppRoute(ScreenPaths.home, (s) => const HomePage()),
  ],
  redirect: (context, state) {
    if (FirebaseAuth.instance.currentUser == null) {
      return '/login';
    }
    return null;
  },
);

/// Custom GoRoute sub-class to make the router declaration easier to read
class AppRoute extends GoRoute {
  AppRoute(String path, Widget Function(GoRouterState s) builder,
      {List<GoRoute> routes = const [], this.useFade = false})
      : super(
          path: path,
          routes: routes,
          pageBuilder: (context, state) {
            final pageContent = Scaffold(
              body: builder(state),
              resizeToAvoidBottomInset: false,
            );
            if (useFade) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: pageContent,
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              );
            }
            return CupertinoPage(child: pageContent);
          },
        );
  final bool useFade;
}
