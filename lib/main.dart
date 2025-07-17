import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/common/shimmer_list.dart';
import 'package:flutter_recipe_app/presentation/screen/saved_recipes/recipe_card_screen.dart';
import 'package:flutter_recipe_app/presentation/screen/saved_recipes/recipe_view_model.dart';
import 'package:flutter_recipe_app/repository/recipes_repository_impl.dart';
import 'package:google_fonts/google_fonts.dart';

import 'data_source/remote/recipe_data_source_impl.dart';

void main() {
  final dataSource = RecipeDataSourceImpl(
    baseUrl: 'https://raw.githubusercontent.com/junsuk5/mock_json/refs/heads/main/recipe/recipes.json',
  );
  final repository = RecipeRepositoryImpl(dataSource);
  final recipeCardViewModel = RecipeCardViewModel(repository);
  recipeCardViewModel.fetchRecipes();

  runApp(MyApp(viewModel: recipeCardViewModel));
}

class MyApp extends StatelessWidget {
  final RecipeCardViewModel viewModel;

  const MyApp({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: false,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),

      home: ListenableBuilder(
        listenable: viewModel,
        builder: (context, child) {
          // print("로딩 상태: ${viewModel.isLoading}");
          if (viewModel.isLoading) {
            return ShimmerList();
          }
          return RecipeCardScreen(
            viewModel: viewModel,
          );
        },
      ),
    );
  }
}
