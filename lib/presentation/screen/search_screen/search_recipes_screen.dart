import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/screen/search_screen/search_recipes_view_model.dart';

import '../../../data/data_source/recipe_data_source_impl.dart';
import '../../../data/repository/recipe_repository_impl.dart';
import '../../component/card/recipe_card.dart';
import '../../component/inputfield/search_input_field.dart';

class SearchRecipesScreen extends StatelessWidget {
  final SearchRecipesViewModel searchRecipesViewModel;

  const SearchRecipesScreen({super.key, required this.searchRecipesViewModel});

  @override
  Widget build(BuildContext context) {
    // final state = searchRecipesViewModel.state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Recipes'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SearchInputField(
                    onValueChange: (query) {
                      searchRecipesViewModel.searchRecipes(query);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                child: Text('三'),
              ),
            ],
          ),
          ListenableBuilder(
            listenable: searchRecipesViewModel,
            builder: (context, _ ) {
              final state = searchRecipesViewModel.state;
              return Row(
                children: [
                  Text(state.searchLabel),
                  Spacer(),
                  Text(state.resultLabel),
                ],
              );
            },
          ),
          Expanded(
            child: ListenableBuilder(
              listenable: searchRecipesViewModel,
              builder: (context, child) {
                final state = searchRecipesViewModel.state;
                if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: searchRecipesViewModel.state.filteredRecipes.length,
                  itemBuilder: (context, index) {
                    final recipe = state.filteredRecipes[index];
                    return RecipeCard(
                      recipe: recipe,
                      onBookmarkPressed: () {},
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() async {
  final searchRecipesViewModel = SearchRecipesViewModel(
    recipeRepository: RecipeRepositoryImpl(
      RecipeDataSourceImpl(),
    ),
  );

  searchRecipesViewModel.fetchSearchRecipes();

  runApp(
    MaterialApp(
      home: SearchRecipesScreen(searchRecipesViewModel: searchRecipesViewModel),
    ),
  );
}
