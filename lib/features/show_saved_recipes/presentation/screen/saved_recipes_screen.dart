import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/make_name_clean.dart';
import 'package:flutter_recipe_app/features/show_saved_recipes/presentation/screen/saved_recipes_view_model.dart';

import '../../../../core/data/recipe/domain/model/recipe.dart';
import '../../../../ui/text_styles.dart';
import '../../../show_ingredients/presentation/component/recipe_card.dart';

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
    final state = viewModel.state;
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
                  itemCount: state.recipes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        onClickCard(state.recipes[index].id);
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: RecipeCard(
                          recipe: Recipe(
                            category: state.recipes[index].category,
                            id: state.recipes[index].id,
                            name:
                                '\n${getRecipeName(
                                  state.recipes[index].name,
                                )}',
                            image: state.recipes[index].image,
                            chef: 'By ${state.recipes[index].chef}',
                            cookingTime: state.recipes[index].cookingTime,
                            rating: state.recipes[index].rating,
                            ingredients: state.recipes[index].ingredients,
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
