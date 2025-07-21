import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/data/mock_data/json_recipes.dart';
import 'package:flutter_recipe_app/data/model/recipe.dart';
import 'package:flutter_recipe_app/presentation/components/cards/searched_recipe_card.dart';
import 'package:flutter_recipe_app/presentation/components/modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class SearchRecipesScreen extends StatelessWidget {
  final bool isShowingSearchResult;

  const SearchRecipesScreen({super.key, required this.isShowingSearchResult});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search recipes',
          style: TextStyles.mediumTextBold,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, size: 40),
                      prefixIconColor: AppColors.gray4,
                      hintText: 'Search recipe',
                      hintStyle: TextStyle(color: AppColors.gray4),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.gray4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: AppColors.primary80,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                IconButton(onPressed: () {
                  showModalBottomSheet(
                    context: context, builder: (BuildContext context) {
                    return ModalBottomSheet();
                  },);
                },
                  icon: Icon(
                    Icons.filter_alt_outlined,
                    size: 40,
                    color: AppColors.primary100,),

                ),
              ],
            ),
            SizedBox(height: 20),
            isShowingSearchResult
                ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Search Result',
                  style: TextStyles.normalTextBold,
                ),
                Text(
                  '256 results',
                  style: TextStyles.smallerTextRegular.copyWith(
                    color: AppColors.gray3,
                  ),
                ),
              ],
            )
                : Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                'Recent Search',
                style: TextStyles.normalTextBold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: jsonRecipes['recipes']!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemBuilder: (BuildContext context, int index) {
                  final jsonRecipe = jsonRecipes['recipes']![index];

                  final String name = jsonRecipe['name'] as String;
                  final String imageUrl = jsonRecipe['image'] as String;
                  final String chef = jsonRecipe['chef'] as String;
                  final String cookingTime = jsonRecipe['time'] as String;
                  final double rating = jsonRecipe['rating'] as double;

                  return SearchedRecipeCard(
                    recipe: Recipe(
                      name: name,
                      imageUrl: imageUrl,
                      chef: chef,
                      cookingTime: cookingTime,
                      rating: rating,
                      onChangeFavorite: () {},
                    ),
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

void main() {
  runApp(
    MaterialApp(
      home: SearchRecipesScreen(isShowingSearchResult: false),
    ),
  );
}
