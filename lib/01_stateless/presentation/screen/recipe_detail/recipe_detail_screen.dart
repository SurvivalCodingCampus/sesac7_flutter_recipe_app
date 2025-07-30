import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/core/enums/menu_option.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/component/buttons/bookmark_button.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/component/buttons/small_button.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/recipe_detail/body_fragment/recipe_detail_ingredient_and_procedure_fragment.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/recipe_detail/recipe_detail_state.dart';
import 'package:flutter_recipe_app/01_stateless/ui/app_colors.dart';
import 'package:flutter_recipe_app/01_stateless/ui/text_styles.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'recipe_detail_action.dart';

/*
void main() {
  runApp(
    MaterialApp(
      home: RecipeDetailScreen(
        viewModel: RecipeDetailViewModel(),
        recipeId: 0,
      ),
    ),
  );
}
*/
class RecipeDetailScreen extends StatelessWidget {
  final RecipeDetailState state;
  final void Function(RecipeDetailAction action) onAction;

  const RecipeDetailScreen({
    super.key,
    required this.state,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(top: 44),
                child: Column(
                  children: [
                    Container(
                      height: 150,
                      width: double.infinity,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Image.network(
                              state.currentRecipe.recipe.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned.fill(
                            child: Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.black54,
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: Container(
                              width: 37,
                              height: 16,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.secondary20,
                              ),
                              child: Center(
                                child: Row(
                                  children: [
                                    const Spacer(),
                                    Icon(
                                      Icons.star,
                                      color: AppColors.rating,
                                      size: 7,
                                    ),
                                    const SizedBox(width: 3),
                                    Text(
                                      state.currentRecipe.recipe.rating
                                          .toStringAsFixed(1),
                                      style: GoogleFonts.poppins(
                                        textStyle:
                                            TextStyles.smallerTextSmallLabel,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 10,
                            bottom: 10,
                            right: 10,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Spacer(),
                                Container(
                                  width: 60,
                                  height: 24,
                                  color: Colors.transparent,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 17,
                                        height: 17,
                                        child: Icon(
                                          Icons.timer_outlined,
                                          size: 17,
                                          color: AppColors.gray4,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        '${state.currentRecipe.recipe.duration} min',
                                        style: GoogleFonts.poppins(
                                          textStyle:
                                              TextStyles.smallerTextRegular,
                                          color: AppColors.gray4,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10),
                                BookmarkButton(size: 24, innerSize: 16, onClick: () {
                                  onAction(RecipeDetailAction.clickOnBookmark(state.currentRecipe.id));
                                }, isAdded: state.currentRecipe.recipe.isBookmarked),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ), // Image part
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 41,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              state.currentRecipe.recipe.name,
                              style: GoogleFonts.poppins(
                                textStyle: TextStyles.smallTextBold,
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '(${state.currentRecipe.reviewCount} Reviews)',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyles.labelRegular,
                              color: AppColors.gray3,
                            ),
                          ),
                        ],
                      ),
                    ), // recipe name and reviews,
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 40,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.network(
                              state.currentRecipe.author.image,
                              fit: BoxFit.cover,
                            ),
                          ), //Creator's picture
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  state.currentRecipe.author.name,
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyles.smallTextBold,
                                    color: AppColors.labelColor,
                                  )
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.location_on_outlined, size: 17, color: AppColors.primary80),
                                    Text(
                                      state.currentRecipe.author.address,
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyles.smallerTextRegular,
                                        color: AppColors.gray3,
                                      )
                                    )
                                  ],
                                )
                              ],
                            ),
                          ), //Creator's name and address
                          //const Spacer(),
                          SmallButton(width: 85, height: 37, color: AppColors.primary100, text: 'Follow', onClick: () {}, isEnabled: true),
                        ],
                      ),
                    ), //Creator's profile
                    const SizedBox(height: 8),
                    RecipeDetailIngredientAndProcedureFragment(recipe: state.currentRecipe),
                  ],
                ),
              ),
            ), //Rest of scrollable displays
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                height: 44,
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => context.pop(),
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: Icon(
                          Icons.arrow_back_outlined,
                          size: 20,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        final selected = await showMenu<MenuOption>(
                          context: context,
                          position: RelativeRect.fromLTRB(100, 20, 0, 0),
                          items: [
                            PopupMenuItem<MenuOption>(
                              value: MenuOption.share,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.share, size: 20, color: AppColors.labelColor),
                                  const SizedBox(width: 16),
                                  Text(
                                    'Share',
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyles.smallTextRegular,
                                      color: AppColors.labelColor,
                                    )
                                  )
                                ],
                              ),
                            ),
                            PopupMenuItem<MenuOption>(
                              value: MenuOption.rate,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.star_rate, size: 20, color: AppColors.labelColor),
                                  const SizedBox(width: 16),
                                  Text(
                                      'Rate Recipe',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyles.smallTextRegular,
                                        color: AppColors.labelColor,
                                      )
                                  )
                                ],
                              ),
                            ),
                            PopupMenuItem<MenuOption>(
                              value: MenuOption.review,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.chat_bubble, size: 20, color: AppColors.labelColor),
                                  const SizedBox(width: 16),
                                  Text(
                                      'Review',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyles.smallTextRegular,
                                        color: AppColors.labelColor,
                                      )
                                  )
                                ],
                              ),
                            ),
                            PopupMenuItem<MenuOption>(
                              value: MenuOption.favorite,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.bookmark_border_outlined, size: 20, color: AppColors.labelColor),
                                  const SizedBox(width: 16),
                                  Text(
                                      state.currentRecipe.recipe.isBookmarked ? 'Unsave' : 'Save',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyles.smallTextRegular,
                                        color: AppColors.labelColor,
                                      )
                                  )
                                ],
                              ),
                            ),

                          ]
                        );

                        if (selected != null) {
                          switch (selected) {
                            case MenuOption.share:
                              break;
                            case MenuOption.rate:
                              onAction(RecipeDetailAction.clickOnRate(state.currentRecipe.id));
                              break;
                            case MenuOption.review:
                              break;
                            case MenuOption.favorite:
                              onAction(RecipeDetailAction.clickOnBookmark(state.currentRecipe.id));
                          }
                        }
                      },
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: Icon(
                          Icons.more_horiz_outlined,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ), //Top toolbar AKA header
          ],
        ),
      ),
    );
  }
}
