import 'package:flutter/material.dart';

class TitleWithCaption extends StatelessWidget {
  const TitleWithCaption({
    super.key,
    required this.title,
    required this.caption,
  });

  final String title;
  final String caption;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24,
            // fontFamily: 'Gilroy',
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(caption),
        const SizedBox(height: 24),
      ],
    );
  }
}
