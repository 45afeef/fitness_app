import 'package:fitness_app/presentations/pages/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/title_with_caption.dart';

class OnboardingSurveyScreen extends StatefulWidget {
  const OnboardingSurveyScreen({super.key});

  @override
  State<OnboardingSurveyScreen> createState() => _OnboardingSurveyScreenState();
}

class _OnboardingSurveyScreenState extends State<OnboardingSurveyScreen> {
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode ageFocusNode = FocusNode();
  final FocusNode weightFocusNode = FocusNode();
  final FocusNode heightFocusNode = FocusNode();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text('Fitness app'),
          ),
          body: ListView(
            children: [
              const TitleWithCaption(
                title: 'About you',
                caption:
                    'We need to know some of your information like, Name, Age, Weight, Height and more. This helps us to create personalized diet plan and workout plans for you\nPlease fill carefully',
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Name'),
                subtitle: TextField(
                  controller: _nameController,
                  focusNode: nameFocusNode,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.numbers),
                title: const Text('Age'),
                subtitle: TextField(
                    controller: _ageController,
                    focusNode: ageFocusNode,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ]),
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Weight'),
                subtitle: TextField(
                  controller: _weightController,
                  focusNode: weightFocusNode,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Height'),
                subtitle: TextField(
                  controller: _heightController,
                  focusNode: heightFocusNode,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    String name = _nameController.text;
                    String age = _ageController.text;
                    String weight = _weightController.text;
                    String height = _heightController.text;

                    if (name.isEmpty) {
                      FocusScope.of(context).requestFocus(nameFocusNode);

                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Forget to say your name?')));
                    } else if (age.isEmpty) {
                      FocusScope.of(context).requestFocus(ageFocusNode);
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('What is your age?')));
                    } else if (weight.isEmpty) {
                      FocusScope.of(context).requestFocus(weightFocusNode);
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please Enter weight')));
                    } else if (height.isEmpty) {
                      FocusScope.of(context).requestFocus(heightFocusNode);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Your height in cm please')));
                    } else {
                      double bmi = int.parse(weight) /
                          ((int.parse(height) / 100) *
                              (int.parse(height) / 100));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BMIScreen(bmi: bmi)));
                    }
                  },
                  child: const Text('Calculate the BMI'))
            ],
          )),
    );
  }
}
