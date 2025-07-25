import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/core/presentation/component/bottom_sheet/filter_search_bottom_sheet.dart';
import 'package:flutter_recipe_app/01_stateless/core/presentation/component/bottom_sheet/filter_search_state.dart';
import 'package:flutter_recipe_app/01_stateless/core/presentation/component/card/recipe_card.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/search_recipes/search_recipes_state.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/search_recipes/search_recipes_view_model.dart';

class SearchRecipesScreen extends StatelessWidget {
  final SearchRecipesViewModel viewModel;

  const SearchRecipesScreen({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<SearchRecipesState>(
      valueListenable: viewModel,
      builder: (context, SearchRecipesState state, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Search recipes'),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: viewModel.search,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          prefixIcon: Icon(Icons.search),
                          hintText: '검색어를 입력하세요',
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () async {
                        showModalBottomSheet<FilterSearchState>(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) {
                            return FilterSearchBottomSheet(
                              filterSearchState: viewModel.state.filterSearchState,
                              onFilter: (state) {
                                viewModel.filter(state);
                                Navigator.pop(context);
                              },
                            );
                          },
                        );
                      },
                      child: const Text('필터'),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(state.searchLabel),
                    Spacer(),
                    Text(state.resultLabel),
                  ],
                ),
                Expanded(
                  child: state.isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1 / 2,
                          ),
                          itemCount: state.filteredRecipes.length,
                          itemBuilder: (context, index) {
                            final recipe = state.filteredRecipes[index];
                            return RecipeCard(
                              recipe: recipe,
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
