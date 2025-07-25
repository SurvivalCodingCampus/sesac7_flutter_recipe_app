import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/core/presentation/component/card/recipe_card.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/search_recipes/search_recipes_action.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/search_recipes/search_recipes_state.dart';

class SearchRecipesScreen extends StatelessWidget {
  final SearchRecipesState state;
  final void Function(SearchRecipesAction action) onAction;

  const SearchRecipesScreen({
    super.key,
    required this.state,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search recipes'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      onAction(SearchRecipesAction.changeQuery(value));
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      prefixIcon: Icon(Icons.search),
                      hintText: '검색어를 입력하세요',
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    onAction(SearchRecipesAction.openDialog());
                  },
                  child: const Text('필터'),
                ),
              ],
            ),
            Row(
              children: [
                Text(state.searchLabel),
                Spacer(),
                Text(state.resultLabel),
              ],
            ),
            Expanded(
              child: state.isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1 / 2,
                      ),
                      itemCount: state.filteredRecipes.length,
                      itemBuilder: (context, index) {
                        final recipe = state.filteredRecipes[index];
                        return GestureDetector(
                          onTap: () {
                            onAction(
                              SearchRecipesAction.clickRecipeItem(recipe),
                            );
                          },
                          child: RecipeCard(
                            recipe: recipe,
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
