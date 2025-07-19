import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/data/mocks/data_source/mock_recipe_data_sourece_impl.dart';
import 'package:flutter_recipe_app/presentation/screen/recipe/search_recipe_screen.dart';
import 'package:flutter_recipe_app/presentation/screen/home/splash_screen.dart';
import 'package:flutter_recipe_app/presentation/screen/recipe/saved_recipe_view_model.dart';
import 'package:flutter_recipe_app/presentation/screen/recipe/saved_recipe_screen.dart';
import 'package:flutter_recipe_app/presentation/screen/recipe/search_recipe_view_model.dart';
import 'package:flutter_recipe_app/presentation/ui/app_color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_recipe_app/data/repository/recipe/recipe_repository_impl.dart';


void main() {
  final recipeDataSource = MockRecipeDataSourceImpl();
  final recipeRepository = RecipeRepositoryImpl(recipeDataSource);
  final recipeViewModel = SearchRecipeViewModel(recipeRepository);

  recipeViewModel.fetchRecipes();

  runApp(
    MyApp(viewModel: recipeViewModel),
  );
}

class MyApp extends StatelessWidget {
  final SearchRecipeViewModel viewModel;

  const MyApp({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColor.White,
          elevation: 0,
        ),
        useMaterial3: true,
      ),
      home: ListenableBuilder(
        listenable: viewModel,
        builder: (context, child) {
          return SearchRecipeScreen(viewModel: viewModel);
        },
      ),
    );
  }
}