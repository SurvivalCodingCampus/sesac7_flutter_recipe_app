import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/make_name_clean.dart';
import 'package:flutter_recipe_app/presentation/screen/search_recipes_screen_view_model.dart';

import '../../ui/app_colors.dart';
import '../../ui/text_styles.dart';
import '../component/filter_button.dart';
import '../component/recipe_card_only_with_name.dart';
import '../component/search_input_field.dart';
import 'filter_search_bottom_sheet.dart';
import 'filter_search_bottom_sheet_state.dart';

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
                      onValueChange: (value) async {
                        viewModel.search(value);
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
                                  viewModel.filterRecipes(
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
                    state.searchLabel,
                    style: TextStyles.normalTextBold.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Text(
                    state.countingLabel,
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
                  itemCount: state.filteredResult.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 15),
                      child: RecipeCardOnlyWithName(
                        recipe: state.filteredResult[index].copyWith(
                          name: getRecipeName(
                            state.filteredResult[index].name,
                          ),
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
