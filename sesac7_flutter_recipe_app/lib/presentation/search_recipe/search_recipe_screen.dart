import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/bottom_sheet/search_recipe_filter_bottom_sheet.dart';
import 'package:flutter_recipe_app/presentation/component/button/search_recipe_filter_button.dart';
import 'package:flutter_recipe_app/presentation/component/card/search_recipe_card.dart';
import 'package:flutter_recipe_app/presentation/component/text_field/search_input_field.dart';
import 'package:flutter_recipe_app/presentation/component/title_bar/screen_title_bar.dart';
import 'package:flutter_recipe_app/presentation/search_recipe/searh_recipe_view_model.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class SearchRecipeScreen extends StatefulWidget {
  final SearchRecipeViewModel _searchRecipeViewModel;

  const SearchRecipeScreen({
    super.key,
    required SearchRecipeViewModel searchRecipeViewModel,
  }) : _searchRecipeViewModel = searchRecipeViewModel;

  @override
  State<SearchRecipeScreen> createState() => _SearchRecipeScreenState();
}

class _SearchRecipeScreenState extends State<SearchRecipeScreen> {
  @override
  void dispose() {
    widget._searchRecipeViewModel.dispose();
    super.dispose();
  }

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
                  textEditingController:
                      widget._searchRecipeViewModel.searchInputFieldController,
                  hint: 'Search recipe',
                  onSearchKeywordChange: (searchKeyword) {
                    if (searchKeyword.isEmpty) {
                      widget._searchRecipeViewModel
                          .clearSearchResultRecipesAndSearchKeyword();
                      widget._searchRecipeViewModel.fetchRecentRecipes();
                    } else {
                      widget._searchRecipeViewModel.fetchSearchResultRecipes(
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
                            widget._searchRecipeViewModel
                                .fetchSearchResultRecipes(
                                  keyword: null,
                                  timeType: timeType,
                                  ratingType: ratingType,
                                  categoryType: categoryType,
                                );
                            widget._searchRecipeViewModel.searchInputFieldController.clear();
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
                    widget
                            ._searchRecipeViewModel
                            .searchRecipesState
                            .searchKeyword
                            .isEmpty
                        ? widget
                                  ._searchRecipeViewModel
                                  .searchRecipesState
                                  .isCategorySearch
                              ? 'Search Result'
                              : 'Recent Search'
                        : 'Search Result',
                    style: TextStyles.searchScreenSubtitle,
                  ),
                  Spacer(),
                  Text(
                    widget
                            ._searchRecipeViewModel
                            .searchRecipesState
                            .searchKeyword
                            .isEmpty
                        ? ''
                        : '${widget._searchRecipeViewModel.searchRecipesState.searchResultRecipes.length} result',
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
                    widget
                        ._searchRecipeViewModel
                        .searchRecipesState
                        .searchKeyword
                        .isEmpty
                    ? widget
                              ._searchRecipeViewModel
                              .searchRecipesState
                              .isCategorySearch
                          ? widget
                                ._searchRecipeViewModel
                                .searchRecipesState
                                .searchResultRecipes
                                .length
                          : widget
                                ._searchRecipeViewModel
                                .searchRecipesState
                                .recentRecipes
                                .length
                    : widget
                          ._searchRecipeViewModel
                          .searchRecipesState
                          .searchResultRecipes
                          .length,
                itemBuilder: (context, index) {
                  final searchKeyword = widget
                      ._searchRecipeViewModel
                      .searchRecipesState
                      .searchKeyword;
                  final isCategorySearch = widget
                      ._searchRecipeViewModel
                      .searchRecipesState
                      .isCategorySearch;
                  final recentList = widget
                      ._searchRecipeViewModel
                      .searchRecipesState
                      .recentRecipes;
                  final searchResultList = widget
                      ._searchRecipeViewModel
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
