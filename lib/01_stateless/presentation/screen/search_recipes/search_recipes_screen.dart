import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/component/card/recipe_card.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/search_recipes/search_recipes_view_model.dart';

void main() {
  final searchRecipesViewModel = SearchRecipesViewModel();
  runApp(
    MaterialApp(
      home: ListenableBuilder(
        listenable: searchRecipesViewModel,
        builder: (context, child) {
          return SearchRecipesScreen(
            viewModel: searchRecipesViewModel,
          );
        },
      ),
    ),
  );
}

class SearchRecipesScreen extends StatelessWidget {
  final SearchRecipesViewModel viewModel;

  const SearchRecipesScreen({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    final state = viewModel.state;
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
                    onChanged: viewModel.search,
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
                  onPressed: () {},
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
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: state.filteredRecipes.length,
                itemBuilder: (context, index) {
                  final recipe = state.filteredRecipes[index];
                  return RecipeCard(
                    recipe: recipe,
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
