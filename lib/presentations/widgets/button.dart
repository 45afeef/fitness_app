import 'package:flutter/material.dart';

class CustomButton extends ElevatedButton {
  const CustomButton({
    super.key,
    required super.onPressed,
    required super.child,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      child: widget.child,
    );
  }
}
