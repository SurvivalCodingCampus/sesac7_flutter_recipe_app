import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/component/displays/recipe_square.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/search_recipes/search_recipes_action.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/search_recipes/search_recipes_state.dart';
import 'package:flutter_recipe_app/01_stateless/ui/app_colors.dart';
import 'package:flutter_recipe_app/01_stateless/ui/text_styles.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    MaterialApp(
      home: SearchRecipesScreen(
        state: SearchRecipesState(),
        onAction: (SearchRecipesAction action) {},
      ),
    ),
  );
}

class SearchRecipesScreen extends StatelessWidget {
  final SearchRecipesState state;
  final void Function(SearchRecipesAction action) onAction;

  const SearchRecipesScreen({
    super.key,
    required this.state,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 44),
            const SizedBox(height: 10),
            Row(
              children: [
                SizedBox(
                  width: 20,
                  height: 20,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    iconSize: 20,
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => onAction(SearchRecipesAction.clickOnBackspace()),
                  ),
                ),
                const Spacer(),
                Text(
                  'Search recipes',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyles.mediumTextBold,
                    color: Colors.black,
                  ),
                ),
                const Spacer(),
                const SizedBox(width: 20, height: 20),
              ],
            ),
            const SizedBox(height: 17),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (text) =>
                        onAction(SearchRecipesAction.typeOnTextField(text)),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 0,
                      ),
                      hintText: 'Search recipe',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: AppColors.gray4,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () => onAction(SearchRecipesAction.bringBottomSheet()),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.primary100,
                    ),
                    child: Icon(
                      Icons.dashboard_customize_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  (state.input == '') ? 'Recent Search' : 'Search Result',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyles.normalTextBold,
                    color: Colors.black,
                  ),
                ),
                const Spacer(),
                Text(
                  (state.input == '') ? '' : '${state.recipes.length} results',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyles.smallerTextRegular,
                    color: AppColors.gray3,
                  ),
                ),
              ],
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.only(top: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 1,
                ),
                itemCount: state.recipes.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => onAction(
                      SearchRecipesAction.clickOnRecipe(
                        state.recipes[index].id,
                      ),
                    ),
                    child: RecipeSquare(recipe: state.recipes[index]),
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
