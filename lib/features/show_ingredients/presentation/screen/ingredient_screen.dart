import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/presentation/component/small_button.dart';
import 'package:flutter_recipe_app/features/show_ingredients/presentation/component/ingredient_item.dart';
import 'package:flutter_recipe_app/features/show_ingredients/presentation/component/recipe_card.dart';

import '../../../../core/presentation/component/left_selected_tabs.dart';
import '../../../../ui/app_colors.dart';
import '../../../../ui/text_styles.dart';
import 'ingredient_action.dart';
import 'ingredient_screen_state.dart';

class IngredientScreen extends StatelessWidget {
  final IngredientScreenState state;
  final void Function(IngredientAction action) onAction;

  const IngredientScreen({
    super.key,
    required this.state,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        decoration: BoxDecoration(color: AppColors.white),
        margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 54),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    onAction(IngredientAction.clickBackButton());
                  },
                  child: Icon(Icons.arrow_back, size: 20),
                ),
                Expanded(child: SizedBox()),
                GestureDetector(
                  onTap: () {
                    onAction(IngredientAction.clickMenuButton());
                  },
                  child: Icon(Icons.more_horiz, size: 24),
                ),
              ],
            ),
            SizedBox(height: 10),
            RecipeCard(
              recipe: state.selectedRecipe.copyWith(
                name: '',
                chef: '',
              ),
              onClick: (id) {},
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.selectedRecipe.name,
                          style: TextStyles.smallTextBold,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '(13k Reviews)',
                        style: TextStyles.smallTextRegular.copyWith(
                          color: AppColors.gray3,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        'https://m.media-amazon.com/images/I/51SLlh1nW5L._UF894,1000_QL80_.jpg',
                      ),
                    ),
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    Text(
                      'Laura wilson',
                      style: TextStyles.smallTextBold,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 17,
                          color: AppColors.primary80,
                        ),
                        Text(
                          'Lagos, Nigeria',
                          style: TextStyles.smallerTextRegular.copyWith(
                            color: AppColors.gray3,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                SmallButton(text: 'Follow', onClick: () {}),
              ],
            ),
            SizedBox(height: 8),
            LeftSelectedTabs(
              listOfLables: ['Ingredient', 'Procedure'],
              selectedIndex: state.indexOfTab,
              onValueChange: (index) {
                onAction(IngredientAction.switchTab(index));
              },
            ),
            SizedBox(height: 22),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.room_service_outlined,
                  size: 17,
                  color: AppColors.gray3,
                ),
                SizedBox(width: 5),
                Text(
                  '1 serve',
                  style: TextStyles.smallerTextRegular.copyWith(
                    color: AppColors.gray3,
                  ),
                ),
                Spacer(),
                Text(
                  state.quantityOfItems,
                  style: TextStyles.smallerTextRegular.copyWith(
                    color: AppColors.gray3,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: IndexedStack(
                index: state.indexOfTab,
                alignment: Alignment.topCenter,
                children: [
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: state.selectedRecipe.ingredients.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 10.0),
                        child: IngredientItem(
                          ingredient: state.selectedRecipe.ingredients[index],
                        ),
                      );
                    },
                  ),
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: state.steps.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.gray4.withValues(alpha: 0.5),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                            margin: EdgeInsets.only(bottom: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'step ${index + 1}',
                                  style: TextStyles.smallerTextBold,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  state.steps[index],
                                  style: TextStyles.smallerTextRegular.copyWith(
                                    color: AppColors.gray3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
