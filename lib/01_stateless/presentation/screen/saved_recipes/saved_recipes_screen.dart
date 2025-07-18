import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/component/recipe_card.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/saved_recipes/saved_recipes_view_model.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../ui/text_styles.dart';

class SavedRecipesScreen extends StatelessWidget {
  final SavedRecipesViewModel viewModel;

  const SavedRecipesScreen({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                    child: RecipeCard(recipe: viewModel.recipes[index], onTap: (){})
                  );
                },
              ),
            )
          )

        ],
      ),
    );
  }
}
