import 'package:flutter/material.dart';

class Tap extends StatelessWidget {
  final List<String> labelList;
  final int selectedIndex;
  final void Function(int) onValueChange;

  const Tap({
    super.key,
    required this.labelList,
    required this.selectedIndex,
    required this.onValueChange,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
