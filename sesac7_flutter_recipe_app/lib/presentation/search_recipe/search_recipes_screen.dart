import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/bottom_sheet/search_recipe_filter_bottom_sheet.dart';
import 'package:flutter_recipe_app/presentation/component/button/search_recipe_filter_button.dart';
import 'package:flutter_recipe_app/presentation/component/card/search_recipe_card.dart';
import 'package:flutter_recipe_app/presentation/component/text_field/search_input_field.dart';
import 'package:flutter_recipe_app/presentation/component/title_bar/screen_title_bar.dart';
import 'package:flutter_recipe_app/presentation/search_recipe/search_recipes_view_model.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class SearchRecipesScreen extends StatelessWidget {
  final SearchRecipesViewModel _searchRecipesViewModel;

  const SearchRecipesScreen({
    super.key,
    required SearchRecipesViewModel searchRecipeViewModel,
  }) : _searchRecipesViewModel = searchRecipeViewModel;

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
                top: 54.0,
                bottom: 17.0,
              ),
              child: ScreenTitleBar(
                title: 'Search recipes',
                backButtonClick: () {
                  print('Back Button Click!!');
                },
              ),
            ),
            Row(
              children: [
                SearchInputField(
                  hint: 'Search recipe',
                  onSearchKeywordChange: (searchKeyword) {
                    if (searchKeyword.isEmpty) {
                      _searchRecipesViewModel
                          .clearSearchResultRecipesAndSearchKeyword();
                      _searchRecipesViewModel.fetchRecentRecipes();
                    } else {
                      _searchRecipesViewModel.fetchSearchResultRecipes(
                        keyword: searchKeyword,
                      );
                    }
                  },
                ),
                SizedBox(
                  width: 20.0,
                ),
                SearchRecipeFilterButton(
                  onClick: () {
                    showModalBottomSheet<void>(
                      context: context,
                      backgroundColor: AppColors.white,
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50.0),
                          topRight: Radius.circular(50.0),
                        ),
                      ),
                      builder: (context) {
                        return SearchRecipeFilterBottomSheet(
                          onValueChange: (timeType, ratingType, categoryType) {
                            _searchRecipesViewModel
                                .fetchSearchResultRecipes(
                                  keyword: null,
                                  timeType: timeType,
                                  ratingType: ratingType,
                                  categoryType: categoryType,
                                );
                          },
                        );
                      },
                    );
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
                    _searchRecipesViewModel
                            .searchRecipesState
                            .searchKeyword
                            .isEmpty
                        ? _searchRecipesViewModel
                                  .searchRecipesState
                                  .isCategorySearch
                              ? 'Search Result'
                              : 'Recent Search'
                        : 'Search Result',
                    style: TextStyles.searchScreenSubtitle,
                  ),
                  Spacer(),
                  Text(
                    _searchRecipesViewModel
                            .searchRecipesState
                            .searchKeyword
                            .isEmpty
                        ? ''
                        : '${_searchRecipesViewModel.searchRecipesState.searchResultRecipes.length} result',
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
                itemCount:
                    _searchRecipesViewModel
                        .searchRecipesState
                        .searchKeyword
                        .isEmpty
                    ? _searchRecipesViewModel
                              .searchRecipesState
                              .isCategorySearch
                          ? _searchRecipesViewModel
                                .searchRecipesState
                                .searchResultRecipes
                                .length
                          : _searchRecipesViewModel
                                .searchRecipesState
                                .recentRecipes
                                .length
                    : _searchRecipesViewModel
                          .searchRecipesState
                          .searchResultRecipes
                          .length,
                itemBuilder: (context, index) {
                  final searchKeyword = _searchRecipesViewModel
                      .searchRecipesState
                      .searchKeyword;
                  final isCategorySearch = _searchRecipesViewModel
                      .searchRecipesState
                      .isCategorySearch;
                  final recentList = _searchRecipesViewModel
                      .searchRecipesState
                      .recentRecipes;
                  final searchResultList = _searchRecipesViewModel
                      .searchRecipesState
                      .searchResultRecipes;
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
