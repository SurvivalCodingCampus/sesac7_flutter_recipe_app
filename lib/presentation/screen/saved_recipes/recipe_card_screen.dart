import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/screen/saved_recipes/recipe_view_model.dart';
import 'package:flutter_recipe_app/presentation/component/recipe_card.dart';

class RecipeCardScreen extends StatelessWidget {

  final RecipeCardViewModel viewModel;

  const RecipeCardScreen({super.key, required this.viewModel});

  // ListenableBuilder : main 에서 하지 않고 screen 에서
  // ListenableBuilder 스크린 마다 하나씩 필요

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
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
      });
  }
}