import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/component/displays/recipe_card.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/nav_bar_screen/body/saved_recipes/saved_recipes_view_model.dart';
import 'package:flutter_recipe_app/01_stateless/ui/text_styles.dart';
import 'package:google_fonts/google_fonts.dart';

class SavedRecipesBody extends StatelessWidget {
  final SavedRecipesViewModel viewModel;
  final void Function(int id) toDetailScreen;

  const SavedRecipesBody({
    super.key,
    required this.viewModel,
    required this.toDetailScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Container(
            width: double.infinity,
            height: 44,
            padding: const EdgeInsets.only(top: 10),
            color: Colors.transparent,
          ),
          Text(
            "Saved recipes",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              textStyle: TextStyles.mediumTextBold,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ListView.builder(
                itemCount: viewModel.recipes.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: RecipeCard(recipe: viewModel.recipes[index], onBookmarkTap: (){
                      viewModel.removeBookmarkedRecipe(index);
                    }, onDetailTap: () => toDetailScreen(viewModel.recipes[index].id),)
                  );
                },
              ),
            )
          )

        ],
    );
  }
}
