import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/data/data_source/recipe/recipe_data_source_impl.dart';
import 'package:flutter_recipe_app/data/model/recipe/search_state_type.dart';
import 'package:flutter_recipe_app/data/repository/recipe/recipe_repository_impl.dart';
import 'package:flutter_recipe_app/presentation/component/button/search_filter_button.dart';
import 'package:flutter_recipe_app/presentation/component/input/search_field.dart';
import 'package:flutter_recipe_app/presentation/component/list_item/recipe_search_card.dart';
import 'package:flutter_recipe_app/presentation/screen/search_recipes/filter_search_bottom_sheet.dart';
import 'package:flutter_recipe_app/presentation/screen/search_recipes/search_recipes_view_model.dart';
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
              Expanded(
                child: state.errorMessage != null
                    ? Center(
                        child: Text(state.errorMessage!),
                      )
                    : GridView.builder(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() async {
  final viewModel = SearchRecipesViewModel(
    recipeRepository: RecipeRepositoryImpl(
      recipeDataSource: RecipeDataSourceImpl(),
    ),
  );
  await viewModel.fetchRecipe();
  runApp(
    MaterialApp(
      home: Scaffold(
        body: ListenableBuilder(
          listenable: viewModel,
          builder: (context, child) {
            return SearchRecipesScreen(viewModel: viewModel);
          },
        ),
      ),
    ),
  );
}
