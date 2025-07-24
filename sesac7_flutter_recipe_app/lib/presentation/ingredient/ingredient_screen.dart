import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/enum/label_type.dart';
import 'package:flutter_recipe_app/domain/model/procedure.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/presentation/component/button/small_button.dart';
import 'package:flutter_recipe_app/presentation/component/card/ingredient_card.dart';
import 'package:flutter_recipe_app/presentation/component/card/recipe_thumbnail_card.dart';
import 'package:flutter_recipe_app/presentation/component/card/step_card.dart';
import 'package:flutter_recipe_app/presentation/component/tab/tabs.dart';
import 'package:flutter_recipe_app/presentation/component/title_bar/screen_title_bar.dart';
import 'package:flutter_recipe_app/presentation/ingredient/ingredient_view_model.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';
import 'package:go_router/go_router.dart';

class IngredientScreen extends StatelessWidget {
  final IngredientViewModel _ingredientViewModel;
  final VoidCallback onBackButtonClick;

  const IngredientScreen({
    super.key,
    required IngredientViewModel ingredientViewModel,
    required this.onBackButtonClick,
  }) : _ingredientViewModel = ingredientViewModel;

  @override
  Widget build(BuildContext context) {
    final Recipe? currentSelectedRecipe =
        _ingredientViewModel.ingredientState.currentSelectedRecipe;
    final List<Procedure> currentSelectedRecipeProcedures =
        _ingredientViewModel.ingredientState.currentSelectedRecipeProcedures;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [
            SizedBox(
              height: 44.0,
            ),
            ScreenTitleBar(
              backButtonClick: onBackButtonClick,
              menuButtonClick: () {},
            ),
            currentSelectedRecipe == null
                ? Expanded(child: Center(child: Text('저장된 ID가 없습니다!')))
                : Expanded(
                    child: Column(
                      children: [
                        RecipeThumbnailCard(
                          recipe: _ingredientViewModel
                              .ingredientState
                              .currentSelectedRecipe!,
                          onFavoritePressed: () {},
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 194.0,
                                child: Text(
                                  currentSelectedRecipe.name,
                                  style: TextStyles.ingredientScreenRecipeName,
                                  maxLines: 2,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Spacer(),
                              Text(
                                '(13k Reviews)',
                                style: TextStyles
                                    .ingredientScreenRecipeReviewCount,
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                'assets/profile_image.png',
                                errorBuilder: (context, error, stackTrace) {
                                  return Icon(Icons.error);
                                },
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Column(
                              children: [
                                Text(
                                  'Laura wilson',
                                  style: TextStyles
                                      .ingredientScreenRecipeCreatorName,
                                  maxLines: 1,
                                ),
                                SizedBox(
                                  height: 2.0,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: AppColors.primary80,
                                      size: 17.0,
                                    ),
                                    Text(
                                      'Logos, Nigeria',
                                      style: TextStyles
                                          .ingredientScreenRecipeCreatorLocation,
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Spacer(),
                            SmallButton(
                              title: 'Follow',
                              onClick: () {},
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Tabs(
                          labelTitles: LabelType.values.stringValues,
                          selectedIndex: _ingredientViewModel
                              .ingredientState
                              .selectedLabelIndex,
                          onValueChange: (index) {
                            _ingredientViewModel.changeTab(index);
                          },
                        ),
                        SizedBox(
                          height: 22.0,
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 3.5,
                                  ),
                                  child: Icon(
                                    Icons.accessibility,
                                    size: 17.0,
                                  ),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  '1 serve',
                                  style: TextStyles.ingredientScreenRecipeServe,
                                  maxLines: 1,
                                ),
                              ],
                            ),
                            Spacer(),
                            _ingredientViewModel
                                        .ingredientState
                                        .selectedLabelIndex ==
                                    0
                                ? Text(
                                    '${currentSelectedRecipe.ingredients.length} items',
                                    style: TextStyles
                                        .ingredientScreenRecipeItemCount,
                                    maxLines: 1,
                                  )
                                : Text(
                                    '${currentSelectedRecipeProcedures.length} Steps',
                                    style: TextStyles
                                        .ingredientScreenRecipeItemCount,
                                    maxLines: 1,
                                  ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Expanded(
                          child: ListView.separated(
                            padding: const EdgeInsets.all(0.0),
                            itemCount:
                                _ingredientViewModel
                                        .ingredientState
                                        .selectedLabelIndex ==
                                    0
                                ? currentSelectedRecipe.ingredients.length
                                : currentSelectedRecipeProcedures.length,
                            itemBuilder: (context, index) {
                              return _ingredientViewModel
                                          .ingredientState
                                          .selectedLabelIndex ==
                                      0
                                  ? IngredientCard(
                                      name: currentSelectedRecipe
                                          .ingredients[index]
                                          .ingredient
                                          .name,
                                      image: currentSelectedRecipe
                                          .ingredients[index]
                                          .ingredient
                                          .image,
                                      amount: currentSelectedRecipe
                                          .ingredients[index]
                                          .amount,
                                    )
                                  : StepCard(
                                      title:
                                          'Step ${currentSelectedRecipeProcedures[index].step}',
                                      description:
                                          currentSelectedRecipeProcedures[index]
                                              .content,
                                    );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 10.0,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
