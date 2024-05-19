import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:fitness_app/features/feed/models/plan.dart';
import 'package:flutter/material.dart';

import 'widgets/plan_card.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final plansQuery = FirebaseFirestore.instance
        .collection('plans')
        //.orderBy('name');
        .withConverter<PlanModel>(
          fromFirestore: (snapshot, options) =>
              PlanModel.fromFirestore(snapshot),
          toFirestore: (value, options) {
            return value.toFirestore();
          },
        );

    return FirestoreListView<PlanModel>(
      query: plansQuery,
      itemBuilder: (context, snapshot) {
        PlanModel plan = snapshot.data();
        return PlanCard(model: plan);
      },
    );
  }
}
