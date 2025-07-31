import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/screen/search_screen/search_recipes_view_model.dart';

import '../../../data/data_source/recipe_data_source_impl.dart';
import '../../../data/repository/recipe_repository_impl.dart';
import '../../component/inputfield/search_input_field.dart';

class SearchRecipesScreen extends StatelessWidget {
  final SearchRecipesViewModel searchRecipesViewModel;

  const SearchRecipesScreen({super.key, required this.searchRecipesViewModel});

  @override
  Widget build(BuildContext context) {
    final state = searchRecipesViewModel.state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Recipes'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchInputField(),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: (){},
            child: Text('三'),
          ),
        ],
      ),
    );
  }
}

void main() async {
  SearchRecipesViewModel searchRecipesViewModel = SearchRecipesViewModel(
    recipeRepository: RecipeRepositoryImpl(
      RecipeDataSourceImpl(),
    ),
  );

  runApp(
    MaterialApp(
      home: SearchRecipesScreen(searchRecipesViewModel: searchRecipesViewModel),
    ),
  );
}
