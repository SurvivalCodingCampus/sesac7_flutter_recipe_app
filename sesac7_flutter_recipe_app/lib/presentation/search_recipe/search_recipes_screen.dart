import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/search_recipe_filter_button.dart';
import 'package:flutter_recipe_app/presentation/component/card/search_recipe_card.dart';
import 'package:flutter_recipe_app/presentation/component/text_field/search_input_field.dart';
import 'package:flutter_recipe_app/presentation/component/title_bar/screen_title_bar.dart';
import 'package:flutter_recipe_app/presentation/search_recipe/search_recipes_action.dart';
import 'package:flutter_recipe_app/presentation/search_recipe/search_recipes_state.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';
import 'package:go_router/go_router.dart';

class SearchRecipesScreen extends StatelessWidget {
  final SearchRecipesState _searchRecipesState;
  final Function(SearchRecipesAction action) onAction;

  const SearchRecipesScreen({
    super.key,
    required SearchRecipesState searchRecipesState,
    required this.onAction,
  }) : _searchRecipesState = searchRecipesState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 40.0,
                bottom: 17.0,
              ),
              child: ScreenTitleBar(
                title: 'Search recipes',
                backButtonClick: () {
                  context.pop();
                },
              ),
            ),
            Row(
              children: [
                SearchInputField(
                  hint: 'Search recipe',
                  onSearchKeywordChange: (keyword) {
                    onAction(SearchRecipesAction.changeKeyword(keyword));
                  },
                ),
                SizedBox(
                  width: 20.0,
                ),
                SearchRecipeFilterButton(
                  onClick: () {
                    onAction(SearchRecipesAction.showFilterBottomSheet());
                  },
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _searchRecipesState.searchKeyword.isEmpty
                        ? _searchRecipesState.isCategorySearch
                              ? 'Search Result'
                              : 'Recent Search'
                        : 'Search Result',
                    style: TextStyles.searchScreenSubtitle,
                  ),
                  Spacer(),
                  Text(
                    _searchRecipesState.searchKeyword.isEmpty
                        ? ''
                        : '${_searchRecipesState.searchResultRecipes.length} result',
                    style: TextStyles.searchScreenSearchResult,
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.only(bottom: 15.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15.0,
                  mainAxisSpacing: 15.0,
                  childAspectRatio: 1,
                ),
                itemCount: _searchRecipesState.searchKeyword.isEmpty
                    ? _searchRecipesState.isCategorySearch
                          ? _searchRecipesState.searchResultRecipes.length
                          : _searchRecipesState.recentRecipes.length
                    : _searchRecipesState.searchResultRecipes.length,
                itemBuilder: (context, index) {
                  final searchKeyword = _searchRecipesState.searchKeyword;
                  final isCategorySearch = _searchRecipesState.isCategorySearch;
                  final recentList = _searchRecipesState.recentRecipes;
                  final searchResultList =
                      _searchRecipesState.searchResultRecipes;
                  return SearchRecipeCard(
                    recipe: searchKeyword.isEmpty
                        ? isCategorySearch
                              ? searchResultList[index]
                              : recentList[index]
                        : searchResultList[index],
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
