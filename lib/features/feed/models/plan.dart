import 'package:cloud_firestore/cloud_firestore.dart';

enum PlanCategory {
  overWeight,
  normal,
  obesity,
  underWeight,
}

class PlanModel {
  final String imageUrl;
  final String heading;
  final String description;
  final PlanCategory category;

  PlanModel({
    required this.imageUrl,
    required this.heading,
    required this.description,
    this.category = PlanCategory.normal,
  });

  Map<String, String> toFirestore() {
    return {
      'imageUrl': imageUrl,
      'heading': heading,
      'description': description,
      'category': category.name,
    };
  }

  factory PlanModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return PlanModel(
      imageUrl: snapshot['imageUrl'],
      heading: snapshot['heading'],
      description: snapshot['description'],
      // category: snapshot['category'],
    );
  }
}
