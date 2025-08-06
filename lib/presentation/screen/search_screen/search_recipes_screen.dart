import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/screen/search_screen/search_recipes_view_model.dart';

import '../../../data/data_source/recipe_data_source_impl.dart';
import '../../../data/repository/recipe_repository_impl.dart';
import '../../component/bottomsheet/filter_search_bottom_sheet.dart';
import '../../component/bottomsheet/filter_search_bottom_sheet_state.dart';
import '../../component/card/recipe_card.dart';
import '../../component/inputfield/search_input_field.dart';

class SearchRecipesScreen extends StatefulWidget {
  final SearchRecipesViewModel searchRecipesViewModel;

  const SearchRecipesScreen({super.key, required this.searchRecipesViewModel});

  @override
  State<SearchRecipesScreen> createState() => _SearchRecipesScreenState();
}

class _SearchRecipesScreenState extends State<SearchRecipesScreen> {
  FilterSearchBottomSheetState filterSearchState = const FilterSearchBottomSheetState();

  @override
  Widget build(BuildContext context) {
    // final state = searchRecipesViewModel.state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Recipes'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SearchInputField(
                    onValueChange: (query) {
                      widget.searchRecipesViewModel.searchRecipes(query);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  final result = await showModalBottomSheet<FilterSearchBottomSheetState> ( //showModalBottomSheet가 future함수임
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      // 현재 필터 filter_search_bottom_sheet.dart에 전달
                      return FilterSearchBottomSheet(filterSearchState: filterSearchState);
                    },
                  );
                  if (result != null) {
                    setState(() {
                      filterSearchState = result;
                    });
                  }
                },
                child: Text('三'),
              ),
            ],
          ),
          ListenableBuilder(
            listenable: widget.searchRecipesViewModel,
            builder: (context, _ ) {
              final state = widget.searchRecipesViewModel.state;
              return Row(
                children: [
                  Text(state.searchLabel),
                  Spacer(),
                  Text(state.resultLabel),
                ],
              );
            },
          ),
          Expanded(
            child: ListenableBuilder(
              listenable: widget.searchRecipesViewModel,
              builder: (context, child) {
                final state = widget.searchRecipesViewModel.state;
                if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: widget.searchRecipesViewModel.state.filteredRecipes.length,
                  itemBuilder: (context, index) {
                    final recipe = state.filteredRecipes[index];
                    return RecipeCard(
                      recipe: recipe,
                      onBookmarkPressed: () {},
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() async {
  final searchRecipesViewModel = SearchRecipesViewModel(
    recipeRepository: RecipeRepositoryImpl(
      RecipeDataSourceImpl(),
    ),
  );

  searchRecipesViewModel.fetchSearchRecipes();

  runApp(
    MaterialApp(
      home: SearchRecipesScreen(searchRecipesViewModel: searchRecipesViewModel),
    ),
  );
}
