import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless_widget/ui/text_styles.dart';
import 'package:flutter_recipe_app/02_stateful_widget/data/model/recipe.dart';
import 'package:flutter_recipe_app/02_stateful_widget/presentation/component/recipe_card.dart';
import 'package:flutter_recipe_app/03_mvvm/presentation/screen/saved_recipes_view_model.dart';

class SavedRecipesScreen extends StatelessWidget {
  final SavedRecipesViewModel viewModel;

  const SavedRecipesScreen({
    super.key,
    required this.viewModel,
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
                    return Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: RecipeCard(
                        recipe: Recipe(
                          category: viewModel.recipes[index].category,
                          id: viewModel.recipes[index].id,
                          name: viewModel.getRecipeName(index),
                          image: viewModel.recipes[index].image,
                          chef: viewModel.recipes[index].chef,
                          cookingTime: viewModel.recipes[index].cookingTime,
                          rating: viewModel.recipes[index].rating,
                          ingredients: viewModel.recipes[index].ingredients,
                        ),
                        onClick: () {
                          print('북마크되었습니다.');
                        },
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
