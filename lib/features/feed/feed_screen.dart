import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:fitness_app/features/feed/models/plan.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widgets/plan_card.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  String? categoryString;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final pref = SharedPreferences.getInstance().then((value) {
      String bmiString = value.getString('bmi') ?? '';
      double bmi = double.parse(bmiString);

      setState(() {
        if (bmi >= 18.5 && bmi <= 25) {
          categoryString = 'normal';
        } else if (bmi > 25 && bmi <= 30) {
          categoryString = 'overWeight';
        } else if (bmi > 30) {
          categoryString = 'obesity';
        } else {
          categoryString = 'underweight';
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final plansQuery = FirebaseFirestore.instance
        .collection('plans')
        .where('category', isEqualTo: categoryString)
        .withConverter<PlanModel>(
          fromFirestore: (snapshot, options) =>
              PlanModel.fromFirestore(snapshot),
          toFirestore: (value, options) {
            return value.toFirestore();
          },
        );

    return categoryString == null
        ? const CircularProgressIndicator()
        : FirestoreListView<PlanModel>(
            query: plansQuery,
            itemBuilder: (context, snapshot) {
              PlanModel plan = snapshot.data();
              return PlanCard(model: plan);
            },
          );
  }
}
