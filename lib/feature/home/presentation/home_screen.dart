import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/presentation/component/button/search_filter_button.dart';
import 'package:flutter_recipe_app/core/presentation/component/constants/component_constant.dart';
import 'package:flutter_recipe_app/core/presentation/component/input/search_field.dart';
import 'package:flutter_recipe_app/feature/home/domain/model/home_recipe_category.dart';
import 'package:flutter_recipe_app/feature/home/presentation/dish_card.dart';
import 'package:flutter_recipe_app/feature/home/presentation/home_view_model.dart';
import 'package:flutter_recipe_app/feature/home/presentation/recipe_category_selector.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class HomeScreen extends StatelessWidget {
  final HomeViewModel viewModel;

  const HomeScreen({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    final state = viewModel.state;

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
                          onValueChange: (value) {},
                        ),
                      ),
                      SearchFilterButton(
                        onTap: () {},
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
              categories: HomeRecipeCategory.values
                  .map((e) => e.toString())
                  .toList(),
              onSelectCategory: (category) {
                viewModel.filterHomeRecipeCategory(category);
              },
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: DishCard.height,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 30),
                itemBuilder: (context, index) {
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

                  return DishCard(
                    recipe: state.filterdRecipes[index],
                    onTapFavorite: (recipe) {
                      // TODO: User
                    },
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  width: 15,
                ),
                itemCount: state.filterdRecipes.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
