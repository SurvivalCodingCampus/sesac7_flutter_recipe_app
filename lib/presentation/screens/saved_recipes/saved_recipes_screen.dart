import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/data/data_source/mock_recipe_data_source_impl.dart';
import 'package:flutter_recipe_app/data/data_source/recipe_data_source_impl.dart';
import 'package:flutter_recipe_app/data/mock_data/json_recipes.dart';
import 'package:flutter_recipe_app/data/model/recipe.dart';
import 'package:flutter_recipe_app/data/recipe_repository/recipe_repository_impl.dart';
import 'package:flutter_recipe_app/presentation/components/cards/recipe_card.dart';
import 'package:flutter_recipe_app/presentation/screens/saved_recipes/saved_recipes_view_model.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';
import 'package:http/http.dart' as http;

class SavedRecipesScreen extends StatelessWidget {
  // 받아서 뿌릴 데이터를 ViewModel로부터 생성자를 통해 viewModel 이름으로 주입받고
  final SavedRecipesViewModel viewModel;

  const SavedRecipesScreen({super.key, required this.viewModel});

  // ListenableBuilder() 를 Scaffold를 감싸거나 
  // body의 ListView.builder를 감싸고 listenable 속성에 viewModel을 설정,
  // 데이터는 List 형태가 많으므로 viewModel.recipes 의 형태,
  // itemCount에 viewModel.recipes.length,
  // itemBuilder 에 리스트의 1개 데이터를 
  // final Recipe recipe = viewModel.recipes[index]; 로 세팅
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Saved recipes',
          style: TextStyles.mediumTextBold,
        ),
        centerTitle: true,
      ),
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context, child) {
          return ListView.builder(
            itemCount: viewModel.saverRecipes.length,
            itemBuilder: (context, index) {
              final Recipe recipe = viewModel.saverRecipes[index];
              final String name = recipe.name;
              final String imageUrl = recipe.imageUrl;
              final String chef = recipe.chef;
              final String cookingTime = recipe.cookingTime;
              final double rating = recipe.rating;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: RecipeCard(
                  recipe: Recipe(
                    name: name,
                    imageUrl: imageUrl,
                    chef: chef,
                    cookingTime: cookingTime,
                    rating: rating,
                    onChangeFavorite: () {},
                  ),
                ),
              );
            },
          );
        }
      ),
    );
  }
}

// void main() {
//   final recipesViewModel = SavedRecipesViewModel(
//     RecipeRepositoryImpl(MockRecipeDataSourceImpl()),
//   );
//
//   recipesViewModel.fetchRecipes();
//
//   runApp(
//     MaterialApp(
//       home: SavedRecipesScreen(viewModel: recipesViewModel,),
//     ),
//   );
// }


// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text(
//         'Saved recipes',
//         style: TextStyles.mediumTextBold,
//       ),
//       centerTitle: true,
//     ),
//     body: ListView.builder(
//       itemCount: jsonRecipes['recipes']!.length,
//       itemBuilder: (context, index) {
//         final jsonRecipe = jsonRecipes['recipes']![index];
//
//         final String name = jsonRecipe['name'] as String;
//         final String imageUrl = jsonRecipe['image'] as String;
//         final String chef = jsonRecipe['chef'] as String;
//         final String cookingTime = jsonRecipe['time'] as String;
//         final double rating = jsonRecipe['rating'] as double;
//
//         return Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//           child: RecipeCard(
//             recipe: Recipe(
//               name: name,
//               imageUrl: imageUrl,
//               chef: chef,
//               cookingTime: cookingTime,
//               rating: rating,
//               onChangeFavorite: () {},
//             ),
//           ),
//         );
//       },
//     ),
//   );
// }
