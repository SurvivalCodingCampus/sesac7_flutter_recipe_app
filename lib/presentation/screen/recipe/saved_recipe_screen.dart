import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/widget/recipe_thumbnail.dart';
import 'package:flutter_recipe_app/presentation/screen/recipe/recipe_view_model.dart';

class SavedRecipeScreen extends StatelessWidget {
  final RecipeViewModel viewModel;

  const SavedRecipeScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    if (viewModel.isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Saved recipes',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (viewModel.recipes.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Saved recipes',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: Center(child: Text('저장된 레시피가 없습니다.')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Saved recipes',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(height: 10),
            ...viewModel.recipes.map((recipe) {
              int minutes = 0;
              try {
                minutes = int.parse(recipe.time.split(' ')[0]);
              } catch (e) {
                minutes = 0;
              }

              return Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: RecipeThumbnail(
                  userName: recipe.chef,
                  firstLine: recipe.name,
                  rating: recipe.rating,
                  minutes: minutes,
                  imageUrl: recipe.image,
                  onTapList: () => print('레시피 ${recipe.name} 클릭'),
                  onTapBookmark: () => print('북마크 ${recipe.name}'),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
