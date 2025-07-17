import 'package:flutter/material.dart';
import '../../model/recipe.dart';
import 'package:flutter_recipe_app/presentation/component/recipe_card.dart';

import '../../repository/recipes_repository.dart';


class RecipeCardScreen extends StatefulWidget {

  const RecipeCardScreen({super.key});

  @override
  State<RecipeCardScreen> createState() => _RecipeCardScreenState();
}

class _RecipeCardScreenState extends State<RecipeCardScreen> {

  List<Recipe> recipes = [];
  final Set<int> bookmarkedIds = {}; // 북마크 상태 저장

  void toggleBookmark(int recipeId) {
    setState(() {
      if (bookmarkedIds.contains(recipeId)) {
        bookmarkedIds.remove(recipeId);
      } else {
        bookmarkedIds.add(recipeId);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    fetchRecipes();
  }

  void fetchRecipes() async {
    final fetched = await RecipesRepository().fetchRecipes();
    setState(() {
      recipes = fetched;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: recipes.map((item) {
            return Column(
              children: [
                RecipeCard(
                  recipe: item,
                  isBookmarked: bookmarkedIds.contains(item.id),
                  onBookmarkTap: () => toggleBookmark(item.id!),
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