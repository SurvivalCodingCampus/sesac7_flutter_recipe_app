import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/small_icon_button.dart';
import 'package:flutter_recipe_app/presentation/component/input/icon_text_input.dart';
import 'package:flutter_recipe_app/presentation/component/widget/small_recipe_card.dart';
import 'package:flutter_recipe_app/presentation/screen/recipe/search_recipe_view_model.dart';
import 'package:flutter_recipe_app/presentation/ui/app_color.dart';

class SearchRecipeScreen extends StatelessWidget {
  final SearchRecipeViewModel viewModel;

  const SearchRecipeScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final state = viewModel.state;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Search Recipes',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: const Icon(Icons.arrow_back, size: 20, color: Colors.black),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(54),
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 20.0,
            ),
            child: Row(
              children: [
                IconTextInput(
                  placeholderText: 'Search',
                  onChanged: (String text) {},
                ),
                SizedBox(width: 20),
                SmallIconButton(icon: Icons.tune),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Search Result',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  '${state.recipes.length} results',
                  style: TextStyle(
                    fontSize: 11,
                    color: AppColor.Gray3,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 1.0,
                ),
                itemCount: state.recipes.length,
                itemBuilder: (BuildContext context, int index) {
                  final recipe = state.recipes[index];
                  return SmallRecipeCard(
                    userName: recipe.chef,
                    imageUrl: recipe.image,
                    firstLine: recipe.name,
                    rating: recipe.rating,
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
