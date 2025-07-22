import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless_widget/ui/app_colors.dart';
import 'package:flutter_recipe_app/01_stateless_widget/ui/text_styles.dart';
import 'package:flutter_recipe_app/04_ui_state_holder/core/make_name_clean.dart';
import 'package:flutter_recipe_app/04_ui_state_holder/presentation/component/filter_button.dart';
import 'package:flutter_recipe_app/04_ui_state_holder/presentation/component/recipe_card_only_with_name.dart';
import 'package:flutter_recipe_app/04_ui_state_holder/presentation/component/search_input_field.dart';
import 'package:flutter_recipe_app/04_ui_state_holder/presentation/screen/filter_search_bottom_sheet.dart';
import 'package:flutter_recipe_app/04_ui_state_holder/presentation/screen/filter_search_bottom_sheet_state.dart';
import 'package:flutter_recipe_app/04_ui_state_holder/presentation/screen/search_recipes_screen_view_model.dart';

class SearchRecipesScreen extends StatelessWidget {
  final SearchRecipesScreenViewModel viewModel;

  const SearchRecipesScreen({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    final state = viewModel.state;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // width: 315,
              height: 27,
              margin: EdgeInsets.fromLTRB(30, 54, 30, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_back, size: 20),
                  Expanded(child: SizedBox(width: 69)),
                  Text(
                    'Search recipes',
                    textAlign: TextAlign.center,
                    style: TextStyles.mediumTextBold,
                  ),
                  Expanded(child: SizedBox()),
                ],
              ),
            ),
            SizedBox(height: 17),
            Container(
              height: 40,
              margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: SearchInputField(
                      placeHolder: 'Search recipe',
                      value: 'value',
                      onValueChange: (value) {
                        viewModel.fetchSearchedRecipes(value);
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  FilterButton(
                    onClick: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        constraints: BoxConstraints(
                          minWidth: double.infinity,
                          minHeight: 484,
                        ),
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (BuildContext context) {
                          return FilterSearchBottomSheet(
                            filterSearchState: state.filterSearchState,
                            onClosing:
                                (
                                  FilterSearchBottomSheetState
                                  filterSearchState,
                                ) {
                                  Navigator.pop(context);
                                  viewModel.fetchFilteredRecipes(
                                    filterSearchState,
                                  );
                                },
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    (state.query == '')
                        ? (state.filteredRecipes.isNotEmpty)
                              ? 'Search Result'
                              : 'Recent Search'
                        : 'Search Result',
                    style: TextStyles.normalTextBold.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Text(
                    (state.query == '')
                        ? (state.filteredRecipes.isNotEmpty)
                              ? '${state.filteredRecipes.length} results'
                              : ''
                        : '${state.searchedResult.length} results',
                    style: TextStyles.smallerTextRegular.copyWith(
                      color: AppColors.gray3,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 한 줄에 2개
                    crossAxisSpacing: 15.0, // 수평 간격
                    childAspectRatio: 1, // 가로세로 비율
                  ),
                  padding: EdgeInsets.zero,
                  itemCount: (state.query == '')
                      ? (state.filteredRecipes.isNotEmpty)
                            ? state.filteredRecipes.length
                            : state.recipes.length
                      : state.searchedResult.length,
                  itemBuilder: (BuildContext context, int index) {
                    return (state.query == '')
                        ? (state.filteredRecipes.isNotEmpty)
                              ? Container(
                                  margin: EdgeInsets.only(bottom: 15),
                                  child: RecipeCardOnlyWithName(
                                    recipe: viewModel
                                        .state
                                        .filteredRecipes[index]
                                        .copyWith(
                                          name: getFilteredRecipeName(index),
                                        ),
                                    onClick: () {
                                      print('북마크되었습니다.');
                                    },
                                  ),
                                )
                              : Container(
                                  margin: EdgeInsets.only(bottom: 15),
                                  child: RecipeCardOnlyWithName(
                                    recipe: state.recipes[index].copyWith(
                                      name: getRecipeName(index),
                                    ),
                                    onClick: () {
                                      print('북마크되었습니다.');
                                    },
                                  ),
                                )
                        : Container(
                            margin: EdgeInsets.only(bottom: 15),
                            child: RecipeCardOnlyWithName(
                              recipe: state.searchedResult[index].copyWith(
                                name: getSearchedRecipeName(index),
                              ),
                              onClick: () {
                                print('북마크되었습니다.');
                              },
                            ),
                          );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
