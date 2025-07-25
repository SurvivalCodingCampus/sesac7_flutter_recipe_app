import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/data/model/detailed_recipe.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/component/displays/ingredient_item.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/component/tabs/tabs_double.dart';
import 'package:flutter_recipe_app/01_stateless/ui/app_colors.dart';
import 'package:flutter_recipe_app/01_stateless/ui/text_styles.dart';
import 'package:google_fonts/google_fonts.dart';

class RecipeDetailIngredientAndProcedureFragment extends StatefulWidget {

  final DetailedRecipe recipe;
  const RecipeDetailIngredientAndProcedureFragment({super.key, required this.recipe});

  @override
  State<RecipeDetailIngredientAndProcedureFragment> createState() => _RecipeDetailIngredientAndProcedureFragmentState();
}

class _RecipeDetailIngredientAndProcedureFragmentState extends State<RecipeDetailIngredientAndProcedureFragment> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TabsDouble(labels: ['Ingredient', 'Procedure'], selectedIndex: _selectedTabIndex, onValueChange: (index) {
          setState(() {
            _selectedTabIndex = index;
          });
        }),
        const SizedBox(height: 22),
        SizedBox(
            height: 24,
            child:
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.fastfood_outlined, size: 17, color: AppColors.gray3),
                const SizedBox(width: 5),
                Text(
                  '1 serve',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyles.smallerTextRegular,
                    color: AppColors.gray3,
                  ),
                ),
                const Spacer(),
                Text(
                  (_selectedTabIndex == 0)? '${widget.recipe.ingredients.length} Items' : '${widget.recipe.procedures.length} Steps',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyles.smallerTextRegular,
                    color: AppColors.gray3,
                  ),
                )
              ],
            )
        ), //Ingredient info or procedure info,
        const SizedBox(height: 20),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: (_selectedTabIndex == 0)? widget.recipe.ingredients.length : widget.recipe.procedures.length,
          itemBuilder: (context, index) {
            if(_selectedTabIndex == 0) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: IngredientItem(ingredient: widget.recipe.ingredients[index]),
              );
            }
            else {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.gray4,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Step ${index + 1}',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyles.smallerTextBold,
                            color: AppColors.labelColor,
                          )
                        ),
                        const SizedBox(height: 5),
                        Text(
                          widget.recipe.procedures[index],
                          style: GoogleFonts.poppins(
                            textStyle: TextStyles.smallerTextRegular,
                            color: AppColors.gray3,
                          ),
                        ),
                      ],
                    )
                  )
                )
              );
            }
          },
        ),
      ],
    );
  }
}
