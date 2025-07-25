import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/make_name_clean.dart';
import 'package:flutter_recipe_app/presentation/screen/saved_recipes_view_model.dart';

import '../../data/model/recipe.dart';
import '../../ui/text_styles.dart';
import '../component/recipe_card.dart';

class SavedRecipesScreen extends StatelessWidget {
  final SavedRecipesViewModel viewModel;
  final void Function(int id) onClickCard;

  const SavedRecipesScreen({
    super.key,
    required this.viewModel,
    required this.onClickCard,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 54),
              Container(
                margin: EdgeInsets.fromLTRB(93, 0, 93, 0),
                child: Text(
                  'Saved recipes',
                  style: TextStyles.mediumTextBold,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: viewModel.recipes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        onClickCard(viewModel.recipes[index].id);
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: RecipeCard(
                          recipe: Recipe(
                            category: viewModel.recipes[index].category,
                            id: viewModel.recipes[index].id,
                            name:
                                '\n${getRecipeName(
                                  viewModel.recipes[index].name,
                                )}',
                            image: viewModel.recipes[index].image,
                            chef: 'By ${viewModel.recipes[index].chef}',
                            cookingTime: viewModel.recipes[index].cookingTime,
                            rating: viewModel.recipes[index].rating,
                            ingredients: viewModel.recipes[index].ingredients,
                          ),
                          onClick: (id) {
                            viewModel.deleteRecipe(id);
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
