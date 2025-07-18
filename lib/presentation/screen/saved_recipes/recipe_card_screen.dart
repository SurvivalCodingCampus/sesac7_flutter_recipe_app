import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/screen/saved_recipes/recipe_view_model.dart';
import 'package:flutter_recipe_app/presentation/component/recipe_card.dart';

class RecipeCardScreen extends StatelessWidget {

  final RecipeCardViewModel viewModel;

  const RecipeCardScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: viewModel.recipes.map((item) {
            return Column(
              children: [
                RecipeCard(
                  recipe: item,
                  isBookmarked: viewModel.bookmarkedIds.contains(item.id),
                  onBookmarkTap: () => viewModel.toggleBookmark(item.id),
                ),
                const SizedBox(height: 12),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}