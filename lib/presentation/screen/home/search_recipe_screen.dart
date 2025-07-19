import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/widget/small_recipe_card.dart';

import '../recipe/saved_recipe_view_model.dart';

class SearchRecipeScreen extends StatelessWidget {
  final RecipeViewModel viewModel;

  const SearchRecipeScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('2개씩 요소 나열 - GridView.count'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(0),
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 1.0,
          children: [
            SmallRecipeCard(userName: '123', firstLine: 'recipe recipe recipe ', imageUrl: ''),
            SmallRecipeCard(userName: '123', firstLine: 'recipe recipe recipe ', imageUrl: ''),
            SmallRecipeCard(userName: '123', firstLine: 'recipe recipe recipe ', imageUrl: ''),
          ],
        ),
      ),
    );
  }
}