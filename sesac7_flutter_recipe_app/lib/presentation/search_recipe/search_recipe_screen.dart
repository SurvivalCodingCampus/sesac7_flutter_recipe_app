import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/bottom_sheet/search_recipe_filter_bottom_sheet.dart';
import 'package:flutter_recipe_app/presentation/component/button/search_recipe_filter_button.dart';
import 'package:flutter_recipe_app/presentation/component/card/search_recipe_card.dart';
import 'package:flutter_recipe_app/presentation/component/text_field/search_input_field.dart';
import 'package:flutter_recipe_app/presentation/component/title_bar/screen_title_bar.dart';
import 'package:flutter_recipe_app/presentation/search_recipe/search_recipe_view_model.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class SearchRecipeScreen extends StatelessWidget {
  final SearchRecipeViewModel _searchRecipeViewModel;

  const SearchRecipeScreen({
    super.key,
    required SearchRecipeViewModel searchRecipeViewModel,
  }) : _searchRecipeViewModel = searchRecipeViewModel;

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
                      _searchRecipeViewModel
                          .clearSearchResultRecipesAndSearchKeyword();
                      _searchRecipeViewModel.fetchRecentRecipes();
                    } else {
                      _searchRecipeViewModel.fetchSearchResultRecipes(
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
                            _searchRecipeViewModel
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
                    _searchRecipeViewModel
                            .searchRecipesState
                            .searchKeyword
                            .isEmpty
                        ? _searchRecipeViewModel
                                  .searchRecipesState
                                  .isCategorySearch
                              ? 'Search Result'
                              : 'Recent Search'
                        : 'Search Result',
                    style: TextStyles.searchScreenSubtitle,
                  ),
                  Spacer(),
                  Text(
                    _searchRecipeViewModel
                            .searchRecipesState
                            .searchKeyword
                            .isEmpty
                        ? ''
                        : '${_searchRecipeViewModel.searchRecipesState.searchResultRecipes.length} result',
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
                    _searchRecipeViewModel
                        .searchRecipesState
                        .searchKeyword
                        .isEmpty
                    ? _searchRecipeViewModel
                              .searchRecipesState
                              .isCategorySearch
                          ? _searchRecipeViewModel
                                .searchRecipesState
                                .searchResultRecipes
                                .length
                          : _searchRecipeViewModel
                                .searchRecipesState
                                .recentRecipes
                                .length
                    : _searchRecipeViewModel
                          .searchRecipesState
                          .searchResultRecipes
                          .length,
                itemBuilder: (context, index) {
                  final searchKeyword = _searchRecipeViewModel
                      .searchRecipesState
                      .searchKeyword;
                  final isCategorySearch = _searchRecipeViewModel
                      .searchRecipesState
                      .isCategorySearch;
                  final recentList = _searchRecipeViewModel
                      .searchRecipesState
                      .recentRecipes;
                  final searchResultList = _searchRecipeViewModel
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
