import 'package:flutter/material.dart';

import '../../../data/model/recipe.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  const RecipeCard({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
          image: NetworkImage(recipe.imgSrc),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Text(
          recipe.toString(),
        ),
      ),
    );
  }
}
