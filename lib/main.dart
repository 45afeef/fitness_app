import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_app/features/authentication/provider/auth_provider.dart';
import 'package:fitness_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() async {
  // Animate.restartOnHotReload = true;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (c) => AuthProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Fitness app',
      theme: ThemeData(
        textTheme: TextTheme(
          displayLarge:
              const TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
          titleLarge:
              GoogleFonts.oswald(fontSize: 30, fontStyle: FontStyle.italic),
          bodyMedium: GoogleFonts.merriweather(),
          displaySmall: GoogleFonts.pacifico(),
          labelSmall: GoogleFonts.nunito(),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          background: Colors.amber[50],
        ),
        useMaterial3: true,
      ),
      routerConfig: appRouter,
    );
  }
}
