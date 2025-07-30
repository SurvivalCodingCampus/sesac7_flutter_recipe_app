import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/features/home/presentation/component/new_recipe_card.dart';

import '../../../../ui/app_colors.dart';
import '../../../../ui/text_styles.dart';
import '../../../search_recipes/presentation/component/filter_button.dart';
import '../../../search_recipes/presentation/component/search_input_field.dart';
import '../component/dish_card.dart';
import '../component/recipe_category_selector.dart';
import 'home_screen_view_model.dart';

class HomeScreen extends StatelessWidget {
  final String greeting = 'Hello Jega';
  final String title = 'What are you cooking today?';

  final HomeScreenViewModel viewModel;

  const HomeScreen({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    final state = viewModel.state;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 64),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(greeting, style: TextStyles.largeTextBold),
                      SizedBox(height: 5),
                      Text(
                        title,
                        style: TextStyles.smallerTextRegular.copyWith(
                          color: AppColors.gray3,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.secondary40,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Icon(Icons.tag_faces_outlined),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      margin: EdgeInsets.only(right: 20.0),
                      child: SearchInputField(
                        placeHolder: 'Search recipe',
                        onValueChange: (value) {},
                      ),
                    ),
                  ),
                  FilterButton(onFilterButtonClick: () {}),
                ],
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Center(
                child: RecipeCategorySelector(
                  category: state.selectedCategory,
                  onSelectCategory: (category) {
                    viewModel.changeCategory(category);
                    viewModel.filterRecipes(category);
                  },
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ...List.generate(state.filteredRecipes.length, (index) {
                      return Container(
                        margin: EdgeInsets.only(right: 9),
                        child: DishCard(
                          recipe: state.filteredRecipes[index],
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Text(
                'New Recipes',
                style: TextStyles.normalTextBold,
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.fromLTRB(22.5, 0, 22.5, 0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ...List.generate(state.filteredRecipes.length, (index) {
                      return Container(
                        margin: EdgeInsets.fromLTRB(7.5, 0, 7.5, 15),
                        child: NewRecipeCard(
                          recipe: state.filteredRecipes[index],
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
