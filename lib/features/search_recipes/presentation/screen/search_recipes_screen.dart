import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/make_name_clean.dart';
import 'package:flutter_recipe_app/features/search_recipes/presentation/screen/search_recipes_action.dart';
import 'package:flutter_recipe_app/features/search_recipes/presentation/screen/search_recipes_screen_state.dart';

import '../../../../ui/app_colors.dart';
import '../../../../ui/text_styles.dart';
import '../component/filter_button.dart';
import '../component/recipe_card_only_with_name.dart';
import '../component/search_input_field.dart';

class SearchRecipesScreen extends StatelessWidget {
  // final SearchRecipesScreenViewModel viewModel;
  final SearchRecipesScreenState state;
  final void Function(SearchRecipesAction action) onAction;

  const SearchRecipesScreen({
    super.key,
    required this.state,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
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
                      onValueChange: (query) {
                        onAction(SearchRecipesAction.changeQuery(query));
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  FilterButton(
                    onFilterButtonClick: () {
                      onAction(SearchRecipesAction.showFilter());
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
