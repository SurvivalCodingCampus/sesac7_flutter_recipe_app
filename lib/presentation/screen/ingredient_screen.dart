import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/ingredient_item.dart';
import 'package:flutter_recipe_app/presentation/component/left_selected_tabs.dart';
import 'package:flutter_recipe_app/presentation/component/recipe_card.dart';
import 'package:flutter_recipe_app/presentation/component/small_button.dart';
import 'package:flutter_recipe_app/presentation/screen/ingredient_screen_view_model.dart';

import '../../ui/app_colors.dart';
import '../../ui/text_styles.dart';

class IngredientScreen extends StatelessWidget {
  final IngredientScreenViewModel viewModel;

  const IngredientScreen({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    final state = viewModel.state;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Container(
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
                  Icon(Icons.arrow_back, size: 20),
                  Expanded(child: SizedBox()),
                  Icon(Icons.more_horiz, size: 24),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          overflow: TextOverflow.ellipsis,
                          state.selectedRecipe.name,
                          // NameOptimizer.getRecipeName(
                          //   state.selectedRecipe.name,
                          // ),
                          style: TextStyles.smallTextBold,
                        ),
                      ],
                    ),
                    Spacer(),
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
                onValueChange: (value) {
                  viewModel.changeIndexOfTab(value);
                  print('now value is $value');
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
              IndexedStack(
                index: state.indexOfTab,
                alignment: Alignment.topCenter,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
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
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: state.steps.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
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
                      );
                    },
                  ),
                ],
              ),

              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
