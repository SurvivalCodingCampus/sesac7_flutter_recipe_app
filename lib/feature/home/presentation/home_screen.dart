import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/presentation/component/button/search_filter_button.dart';
import 'package:flutter_recipe_app/core/presentation/component/constants/component_constant.dart';
import 'package:flutter_recipe_app/core/presentation/component/input/search_field.dart';
import 'package:flutter_recipe_app/feature/home/domain/model/home_recipe_category.dart';
import 'package:flutter_recipe_app/feature/home/presentation/component/dish_card.dart';
import 'package:flutter_recipe_app/feature/home/presentation/home_action.dart';
import 'package:flutter_recipe_app/feature/home/presentation/home_state.dart';
import 'package:flutter_recipe_app/feature/home/presentation/component/recipe_category_selector.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class HomeScreen extends StatelessWidget {
  final HomeState state;
  final void Function(HomeAction action) onAction;

  const HomeScreen({
    super.key,
    required this.state,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(30, 20, 30, 15),
              child: Column(
                spacing: 30,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        spacing: 5,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            // TODO: User
                            'Hello Jega',
                            style: TextStyles.largeTextBold,
                          ),
                          Text(
                            'What are you cooking today?',
                            style: TextStyles.smallerTextRegular.copyWith(
                              color: AppColors.gray3,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColors.secondary40,
                          borderRadius: BorderRadius.circular(
                            ComponentConstant.borderRadius,
                          ),
                        ),
                        child: Image.asset(
                          'assets/images/avator/avator-sample.png',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 20,
                    children: [
                      Expanded(
                        child: SearchField(
                          placeholder: 'Search recipe',
                          onValueChange: (value) {
                            onAction(HomeAction.searchValueChange(value));
                          },
                        ),
                      ),
                      SearchFilterButton(
                        onTap: () {
                          onAction(HomeAction.tapFilterButton());
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            RecipeCategorySelector(
              categories: HomeRecipeCategory.values,
              onSelectCategory: (category) {
                onAction(HomeAction.selectCategory(category));
              },
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: DishCard.height,
              child: Builder(
                builder: (context) {
                  if (state.isLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state.errorMessage.isNotEmpty) {
                    return Center(
                      child: Text(state.errorMessage),
                    );
                  }

                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(left: 30),
                    itemBuilder: (context, index) {
                      return DishCard(
                        recipe: state.filteredRecipes[index],
                        onTapFavorite: (recipe) {
                          onAction(HomeAction.tapFavorite(recipe));
                        },
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 15,
                    ),
                    itemCount: state.filteredRecipes.length,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
