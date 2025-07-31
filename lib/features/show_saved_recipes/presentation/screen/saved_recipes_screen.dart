import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/features/show_saved_recipes/presentation/screen/saved_recipes_action.dart';
import 'package:flutter_recipe_app/features/show_saved_recipes/presentation/screen/saved_recipes_screen_state.dart';

import '../../../../ui/text_styles.dart';
import '../../../show_ingredients/presentation/component/recipe_card.dart';

class SavedRecipesScreen extends StatelessWidget {
  final SavedRecipesScreenState state;
  final void Function(SavedRecipesAction action) onAction;

  const SavedRecipesScreen({
    super.key,
    required this.onAction,
    required this.state,
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
                  itemCount: state.recipes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        onAction(
                          SavedRecipesAction.clickRecipeCard(
                            state.recipes[index].id,
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: RecipeCard(
                          recipe: state.recipes[index],
                          onClick: (id) {
                            onAction(
                              SavedRecipesAction.clickBookmarkButton(id),
                            );
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
