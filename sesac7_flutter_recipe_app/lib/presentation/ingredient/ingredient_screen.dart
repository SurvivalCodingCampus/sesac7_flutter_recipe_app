import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/enum/label_type.dart';
import 'package:flutter_recipe_app/core/enum/popup_menu_type.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/presentation/component/button/small_button.dart';
import 'package:flutter_recipe_app/presentation/component/card/ingredient_card.dart';
import 'package:flutter_recipe_app/presentation/component/card/recipe_thumbnail_card.dart';
import 'package:flutter_recipe_app/presentation/component/card/step_card.dart';
import 'package:flutter_recipe_app/presentation/component/tab/tabs.dart';
import 'package:flutter_recipe_app/presentation/component/title_bar/screen_title_bar.dart';
import 'package:flutter_recipe_app/presentation/ingredient/ingredient_action.dart';
import 'package:flutter_recipe_app/presentation/ingredient/ingredient_state.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class IngredientScreen extends StatelessWidget {
  final IngredientState _ingredientState;
  final Function(IngredientAction) onAction;

  const IngredientScreen({
    super.key,
    required IngredientState ingredientState,
    required this.onAction,
  }) : _ingredientState = ingredientState;

  @override
  Widget build(BuildContext context) {
    final Recipe? currentSelectedRecipe =
        _ingredientState.currentSelectedRecipe;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [
            SizedBox(
              height: 44.0,
            ),
            ScreenTitleBar(
              backButtonClick: () {
                onAction(
                  IngredientAction.clickIngredientBackButton(),
                );
              },
              popupMenuItemClick: (menuType) {
                onAction(IngredientAction.clickPopupMenuItem(menuType));
              },
            ),
            currentSelectedRecipe == null
                ? Expanded(child: Center(child: Text('저장된 ID가 없습니다!')))
                : Expanded(
                    child: Column(
                      children: [
                        RecipeThumbnailCard(
                          recipe: currentSelectedRecipe,
                          isBookmark: true,
                          onFavoritePressed: () {
                            // fixme Bookmark 변경 필요
                          },
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5.0,
                          ),
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
                          selectedIndex: _ingredientState.selectedLabelIndex,
                          onValueChange: (index) {
                            onAction(
                              IngredientAction.changeIngredientTapSelectedIndex(
                                index,
                              ),
                            );
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
                            _ingredientState.selectedLabelIndex == 0
                                ? Text(
                                    '${currentSelectedRecipe.ingredients.length} items',
                                    style: TextStyles
                                        .ingredientScreenRecipeItemCount,
                                    maxLines: 1,
                                  )
                                : Text(
                                    '${_ingredientState.currentSelectedRecipeProcedures.length} Steps',
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
                            itemCount: _ingredientState.selectedLabelIndex == 0
                                ? currentSelectedRecipe.ingredients.length
                                : _ingredientState
                                      .currentSelectedRecipeProcedures
                                      .length,
                            itemBuilder: (context, index) {
                              return _ingredientState.selectedLabelIndex == 0
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
                                          'Step ${_ingredientState.currentSelectedRecipeProcedures[index].step}',
                                      description: _ingredientState
                                          .currentSelectedRecipeProcedures[index]
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
