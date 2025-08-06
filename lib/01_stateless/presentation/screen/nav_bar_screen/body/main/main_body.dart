import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/nav_bar_screen/body/main/main_action.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/nav_bar_screen/body/main/main_fragment/main_category_fragment.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/nav_bar_screen/body/main/main_state.dart';
import 'package:flutter_recipe_app/01_stateless/ui/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../ui/text_styles.dart';

class MainBody extends StatelessWidget {
  final MainState state;
  final void Function(MainAction action) onAction;

  const MainBody({
    super.key,
    required this.state,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 44), // status bar placeholder
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello ${state.userId}',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyles.largeTextBold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'What are you cooking today?',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyles.smallerTextRegular,
                      color: AppColors.gray3,
                    ),
                  ),
                ],
              ), // hello what are you cooking today part
              const Spacer(),
              SizedBox(
                width: 40,
                height: 40,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.secondary40,
                  ),
                ),
              ), // user profile picture
            ],
          ),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () => onAction(MainAction.clickOnSearch()),
            child: Container(
              width: double.infinity,
              height: 40,
              color: Colors.black,
            ),
          ), // search bar placeholder
          const SizedBox(height: 15),
          MainCategoryFragment(
            tabs: state.tabs,
            onTabTap: (int index) {
              onAction(MainAction.clickCategoryTab(index));
            },
            onBookmarkTap: (int recipeId) {
              onAction(MainAction.clickOnBookmark(recipeId));
            },
            onRecipeTap: (int recipeId) {
              onAction(MainAction.clickOnRecipe(recipeId));
            },
            filteredRecipe: state.currentRecipes,
            ),
          const Spacer(),
        ],
      ),
    );
  }
}
