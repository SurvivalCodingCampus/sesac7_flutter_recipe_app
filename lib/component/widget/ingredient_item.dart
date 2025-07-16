import 'package:flutter/material.dart';

class IngredientItem extends StatelessWidget {
  final String? imageUrl;
  final String? name;
  final int? amount;

  const IngredientItem({
    super.key,
    this.imageUrl = '',
    this.name = '',
    this.amount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text('$name')
        ],
      ),
    );
  }
}
