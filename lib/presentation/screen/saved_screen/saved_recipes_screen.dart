import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/screen/saved_screen/saved_recipes_view_model.dart';

import '../../../data/data_source/recipe_data_source_impl.dart';
import '../../../data/repository/recipe_repository_impl.dart';
import '../../component/card/recipe_card.dart';
import '../../component/inputfield/input_field.dart';

class SavedRecipesScreen extends StatelessWidget {
  final SavedRecipesViewModel savedRecipesViewModel;

  // 생성자로 viewModel을 주입 받음
  const SavedRecipesScreen({super.key, required this.savedRecipesViewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Recipes'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListenableBuilder(
              listenable: savedRecipesViewModel,
              builder: (context, child) {
                final state = savedRecipesViewModel.state;
                if (state.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state.errorMessage != null) {
                  return Center(
                    child: Text(
                      state.errorMessage!,
                      style: const TextStyle(color: Colors.red, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  );
                }
                if (state.savedRecipes.isEmpty) {
                  return const Center(
                    child: Text('저장된 레시피가 없습니다.'),
                  );
                }
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  // 상하좌우 패딩 또는 마진 // 동적으로 이미지 변경
                  itemCount: state.savedRecipes.length,
                  itemBuilder: (context, index) {
                    final recipe = state.savedRecipes[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: RecipeCard(
                        recipe: recipe,
                        onBookmarkPressed: () {},
                      ),
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
  final savedRecipesViewModel = SavedRecipesViewModel(
    recipeRepository: RecipeRepositoryImpl(
      RecipeDataSourceImpl(),
    ),
  );

  savedRecipesViewModel.fetchSavedRecipes();

  runApp(
    MaterialApp(
      home: SavedRecipesScreen(savedRecipesViewModel: savedRecipesViewModel),
    ),
  );
}
