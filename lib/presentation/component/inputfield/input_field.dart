import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final String placeHolder;
  final String value;
  final void Function(String)? onValueChange;

  const InputField({
    super.key,
    required this.label,
    required this.placeHolder,
    required this.value,
    required this.onValueChange,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
