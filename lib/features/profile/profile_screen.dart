import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 150,
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&auto=format&crop=faces&h=500&w=500&fit=crop'),
              ),
              SizedBox(height: 10),
              Text(
                'Username',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'User Bio',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
              // Add more widgets for the profile information as needed
              Profilekeyvalues('Weight', '60'),
              Profilekeyvalues('Height', '150 cm'),
              Profilekeyvalues('Age', '38'),
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
