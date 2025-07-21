import 'package:flutter_recipe_app/presentation/screen/search_recipes/filter/search_filter_model.dart';
import 'package:flutter_recipe_app/presentation/screen/search_recipes/filter/search_input_state.dart';
import '../../../model/recipe.dart';

class SearchRecipesState {
  final String searchText;
  final bool isFocused;
  final bool isDisabled;
  final FilterModel filter;
  final List<Recipe> results;

  const SearchRecipesState({
    required this.searchText,
    required this.isFocused,
    required this.isDisabled,
    required this.filter,
    required this.results,
  });

  SearchInputModel get searchInputModel {
    final bool isFilled = searchText.isNotEmpty;

    SearchInputState inputState;

    if (isDisabled) {
      inputState = SearchInputState.disabled;
    } else if (isFocused && isFilled) {
      inputState = SearchInputState.filledFocus;
    } else if (isFocused) {
      inputState = SearchInputState.focus;
    } else if (isFilled) {
      inputState = SearchInputState.filled;
    } else {
      inputState = SearchInputState.defaultState;
    }

    return SearchInputModel(
      inputState: inputState,
      text: searchText,
    );
  }

  SearchRecipesState copyWith({
    String? searchText,
    bool? isFocused,
    bool? isDisabled,
    FilterModel? filter,
    List<Recipe>? results,
  }) {
    return SearchRecipesState(
      searchText: searchText ?? this.searchText,
      isFocused: isFocused ?? this.isFocused,
      isDisabled: isDisabled ?? this.isDisabled,
      filter: filter ?? this.filter,
      results: results ?? this.results,
    );
  }

  factory SearchRecipesState.initial() {
    return SearchRecipesState(
      searchText: '',
      isFocused: false,
      isDisabled: false,
      filter: FilterState.initial(),
      results: [],
    );
  }
}
