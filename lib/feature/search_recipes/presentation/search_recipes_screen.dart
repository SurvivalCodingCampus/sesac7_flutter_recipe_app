import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/model/search_state_type.dart';
import 'package:flutter_recipe_app/core/presentation/component/button/search_filter_button.dart';
import 'package:flutter_recipe_app/core/presentation/component/input/search_field.dart';
import 'package:flutter_recipe_app/core/presentation/component/list_item/recipe_search_card.dart';
import 'package:flutter_recipe_app/feature/search_recipes/presentation/filter_search_bottom_sheet.dart';
import 'package:flutter_recipe_app/feature/search_recipes/presentation/search_recipes_view_model.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class SearchRecipesScreen extends StatelessWidget {
  final SearchRecipesViewModel viewModel;

  const SearchRecipesScreen({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    final state = viewModel.state;
    final recipes = state.filteredRecipes;

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
                      onValueChange: viewModel.searchRecipe,
                    ),
                  ),
                  SearchFilterButton(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => FilterSearchBottomSheet(
                          filterState: state.filterState,
                          onFilterChange: (filterState) {
                            viewModel.selectFilter(filterState);
                            Navigator.pop(context);
                          },
                        ),
                      );
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
                  if (state.errorMessage != null) {
                    return Center(
                      child: Text(state.errorMessage!),
                    );
                  }

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
                      itemCount: recipes.length,
                      itemBuilder: (context, index) {
                        return RecipeSearchCard(recipe: recipes[index]);
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
