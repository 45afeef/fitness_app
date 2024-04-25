import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: const [
            SizedBox(height: 64),
            Text("Your Recommended Diet"),
            MyCard(
              imageUrl:
                  'https://images.unsplash.com/photo-1565895405138-6c3a1555da6a',
              heading: 'Fuel Muscle Growth',
              description:
                  'Boost muscle repair and growth with lean protein sources like chicken, fish, tofu, and legumes.',
            ),
            MyCard(
              imageUrl:
                  'https://images.unsplash.com/photo-1561043433-aaf687c4cf04',
              heading: 'Fat Loss Strategy',
              description:
                  'Achieve fat loss by reducing carbohydrate intake and increasing healthy fats. Focus on avocados, nuts, and ,',
            ),
            MyCard(
              imageUrl:
                  'https://images.unsplash.com/photo-1509722747041-616f39b57569',
              heading: 'Heart-Healthy Choices',
              description:
                  'Promote heart health with a diet rich in fruits, vegetables, whole grains, and olive oil. Include fish and ,',
            ),
            MyCard(
              imageUrl:
                  'https://images.unsplash.com/photo-1556386734-4227a180d19e',
              heading: 'Plant-Powered Eating',
              description:
                  'Embrace plant-based foods by avoiding all animal products. Opt for beans, lentils, nuts, and whole grains.,',
            ),
            MyCard(
              imageUrl:
                  'https://images.unsplash.com/photo-1551276929-3f75211e0986',
              heading: 'Metabolic Boost',
              description:
                  'Alternate between eating and fasting periods to improve metabolism and promote weight loss.',
            ),
            SizedBox(height: 64),
            Text("Your Recommended Workout plan"),
            MyCard(
              imageUrl:
                  'https://images.unsplash.com/photo-1584735935682-2f2b69dff9d2',
              heading: 'Build Muscle Power',
              description:
                  'Strengthen your muscles and increase overall strength with weightlifting exercises like squats, deadlifts, ,',
            ),
            MyCard(
              imageUrl:
                  'https://images.unsplash.com/photo-1518644961665-ed172691aaa1',
              heading: 'Cardiovascular Fitness',
              description:
                  'Improve cardiovascular health with activities like running, cycling, or swimming.',
            ),
            MyCard(
              imageUrl:
                  'https://plus.unsplash.com/premium_photo-1666736570873-36d95bd8ee3f',
              heading: 'Mind-Body Balance',
              description:
                  'Enhance flexibility, balance, and mental well-being through yoga poses and focused breathing.',
            ),
            MyCard(
              imageUrl:
                  'https://images.unsplash.com/photo-1521804906057-1df8fdb718b7',
              heading: 'Calorie Burner',
              description:
                  'Burn calories and boost metabolism with short bursts of intense exercise followed by brief rest periods.',
            ),
            MyCard(
              imageUrl:
                  'https://images.unsplash.com/photo-1434596922112-19c563067271',
              heading: 'Core Strength',
              description:
                  'Strengthen core muscles and improve posture with controlled movements and mindful breathing.',
            ),
          ],
        ),
      ),
    ));
  }
}

// class MyCard extends StatelessWidget {
//   final String imagePath;
//   final String heading;
//   final String description;

//   const MyCard({
//     super.key,
//     required this.imagePath,
//     required this.heading,
//     required this.description,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12.0),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           ClipRRect(
//             borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(12.0),
//               topRight: Radius.circular(12.0),
//             ),
//             child: Image.asset(
//               imagePath,
//               fit: BoxFit.cover,
//               height: 150,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   heading,
//                   style: const TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 Text(
//                   description,
//                   style: const TextStyle(fontSize: 14),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class MyCard extends StatelessWidget {
  final String imageUrl;
  final String heading;
  final String description;

  const MyCard({
    super.key,
    required this.imageUrl,
    required this.heading,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
            ),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              height: 150,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  heading,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}