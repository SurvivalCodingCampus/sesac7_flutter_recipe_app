import 'dart:async';

import 'package:flutter_recipe_app/01_stateless/core/presentation/component/bottom_sheet/filter_search_state.dart';
import 'package:flutter_recipe_app/01_stateless/core/result.dart';
import 'package:flutter_recipe_app/01_stateless/domain/use_case/fetch_recipes_use_case.dart';
import 'package:flutter_recipe_app/01_stateless/domain/use_case/search_recipes_use_case.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/search_recipes/search_recipes_action.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/search_recipes/search_recipes_event.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/search_recipes/search_recipes_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../di/di_setup.dart';
import '../../../domain/model/recipe.dart';

part 'search_recipes_view_model.g.dart';

@riverpod
class SearchRecipesNotifier extends _$SearchRecipesNotifier {
  final _eventController = StreamController<SearchRecipesEvent>();

  Stream<SearchRecipesEvent> get eventStream => _eventController.stream;

  @override
  SearchRecipesState build() {
    return SearchRecipesState();
  }

  void onAction(SearchRecipesAction action) {
    switch (action) {
      case ChangeQuery():
        _search(action.query);
      case ClickFilterButton():
        _eventController.add(SearchRecipesEvent.openDialog());
      case ClickRecipeItem():
        print(action.recipe);
      case ApplyFilter():
        _filter(action.state);
      case ClickTitle():
        _eventController.add(SearchRecipesEvent.showErrorMessage('에러!!!!!!'));
    }
  }

  void fetchRecipes() async {
    state = state.copyWith(isLoading: true);

    try {
      final result = await ref.read(getRecipesProvider.future).timeout(
        Duration(seconds: 10),
        onTimeout: () {
          return Result.error('요청 시간이 초과되었습니다. 네트워크 연결을 확인해주세요.');
        },
      );
      
      switch (result) {
        case Success<List<Recipe>>():
          state = state.copyWith(
            originalRecipes: result.data,
            filteredRecipes: result.data,
            isLoading: false,
          );
          _filter(state.filterSearchState);
        case Error<List<Recipe>>():
          state = state.copyWith(isLoading: false);
          _eventController.add(
            SearchRecipesEvent.showErrorMessage(result.message),
          );
      }
    } catch (e) {
      state = state.copyWith(isLoading: false);
      _eventController.add(
        SearchRecipesEvent.showErrorMessage('데이터를 불러오는 중 오류가 발생했습니다.'),
      );
    }
  }

  void _searchWithFilter(String query, FilterSearchState filterSearchState) {
    final searchedRecipes = getIt<SearchRecipesUseCase>().execute(
      state.originalRecipes,
      query,
      filterSearchState,
    );

    state = state.copyWith(
      query: query,
      searchLabel: state.originalRecipes.length == searchedRecipes.length
          ? 'Recent Search'
          : 'Search Result',
      filteredRecipes: searchedRecipes,
      filterSearchState: filterSearchState,
      resultLabel: query.isEmpty ? '' : '${searchedRecipes.length} results',
    );
  }

  void _search(String query) {
    _searchWithFilter(query, state.filterSearchState);
  }

  void _filter(FilterSearchState filterSearchState) {
    _searchWithFilter(state.query, filterSearchState);
  }
}
