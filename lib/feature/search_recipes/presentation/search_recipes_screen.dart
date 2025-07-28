import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/model/search_state_type.dart';
import 'package:flutter_recipe_app/core/presentation/component/button/search_filter_button.dart';
import 'package:flutter_recipe_app/core/presentation/component/input/search_field.dart';
import 'package:flutter_recipe_app/core/presentation/component/list_item/recipe_search_card.dart';
import 'package:flutter_recipe_app/feature/search_recipes/presentation/search_recipes_action.dart';
import 'package:flutter_recipe_app/feature/search_recipes/presentation/search_recipes_state.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class SearchRecipesScreen extends StatelessWidget {
  final SearchRecipesState state;
  final void Function(SearchRecipesAction action) onAction;

  const SearchRecipesScreen({
    super.key,
    required this.state,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search recipes',
          style: TextStyles.mediumTextBold,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            spacing: 20,
            children: [
              Row(
                spacing: 20,
                children: [
                  Expanded(
                    child: SearchField(
                      placeholder: 'Search recipe',
                      value: state.searchFieldValue,
                      onValueChange: (value) {
                        onAction(SearchRecipesAction.changeSearchValue(value));
                      },
                    ),
                  ),
                  SearchFilterButton(
                    onTap: () {
                      onAction(SearchRecipesAction.tapFilterButton());
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    state.searchState.value,
                    style: TextStyles.normalTextBold,
                  ),
                  const Spacer(),
                  if (state.searchState == SearchStateType.searchResult)
                    Text(
                      '${state.resultCount} results',
                      style: TextStyles.smallerTextRegular.copyWith(
                        color: AppColors.gray3,
                      ),
                    ),
                ],
              ),
              Builder(
                builder: (context) {
                  if (state.isLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                      ),
                      itemCount: state.filteredRecipes.length,
                      itemBuilder: (context, index) {
                        return RecipeSearchCard(
                          recipe: state.filteredRecipes[index],
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
