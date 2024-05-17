import 'package:fitness_app/presentations/pages/survey_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? name;
  String? age;
  String? weight;
  String? height;
  String? bmi;

  void _loadData() async {
    final prefs = await SharedPreferences.getInstance();

    name = prefs.getString('name') ?? '';
    age = prefs.getString('age') ?? '';
    weight = prefs.getString('weight') ?? '';
    height = prefs.getString('height') ?? '';
    bmi = prefs.getString('bmi') ?? '';
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF833ab4), // Purple
              Color(0xFFfd1d1d), // Red
              Color(0xFFfcb045), // Orange
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const CircleAvatar(
                radius: 150,
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&auto=format&crop=faces&h=500&w=500&fit=crop'),
              ),
              const SizedBox(height: 10),
              Text(
                '$name',
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'User Bio',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
              // Add more widgets for the profile information as needed
              Profilekeyvalues('Weight', '$weight kg'),
              Profilekeyvalues('Height', '$height cm'),
              Profilekeyvalues('Age', '$age'),
              Profilekeyvalues('My Current BMI', '$bmi'),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SurveyScreen()));
                  },
                  child: const Text('Recalculate BMI'))
            ],
          ),
        ),
      ),
    );
  }
}

class Profilekeyvalues extends StatelessWidget {
  const Profilekeyvalues(
    this.label,
    this.value, {
    super.key,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
