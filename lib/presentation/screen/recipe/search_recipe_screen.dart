import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/widget/small_recipe_card.dart';
import 'package:flutter_recipe_app/presentation/screen/recipe/search_recipe_view_model.dart';

class SearchRecipeScreen extends StatelessWidget {
  final SearchRecipeViewModel viewModel;

  const SearchRecipeScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final state = viewModel.state;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search Recipes',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: const Icon(Icons.arrow_back, size: 20, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 1.0,
          ),
          itemCount: state.recipes.length,
          itemBuilder: (BuildContext context, int index) {
            final recipe = state.recipes[index];
            return SmallRecipeCard(
              userName: recipe.chef,
              imageUrl: recipe.image,
              firstLine: recipe.name,
              rating: recipe.rating,
            );
          },
        ),
      ),
    );
  }
}
