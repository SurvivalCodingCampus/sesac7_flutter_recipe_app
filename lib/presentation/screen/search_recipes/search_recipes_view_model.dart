import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/presentation/screen/search_recipes/search_recipes_state.dart';
import 'package:flutter_recipe_app/data/repository/recipes_repository.dart';

import '../../component/bottom_sheet/filter_search_state.dart';

class SearchRecipesViewModel with ChangeNotifier {
  final RecipeRepository _repository;

  SearchRecipesState _state = SearchRecipesState.initial();
  SearchRecipesState get state => _state;
  // search_recipes_state 파일에서 initial 초기화
  // 외부에서 캡슐화된 _state를 사용할 수 있게 getter 함수 생성

  SearchRecipesViewModel({required RecipeRepository repository})
    : _repository = repository;
  // 생성자 생성

  // get 말고 fetch 로
  // return 하지말고
  Future<void> loadRecipes() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    try {
      await Future.delayed(const Duration(seconds: 2));
      final result = await _repository.fetchRecipes();

      result.when(
        success: (fetchedRecipes) {
          _state = state.copyWith(
            originalRecipes: fetchedRecipes,
            filteredRecipes: fetchedRecipes,
            resultLabel: '${fetchedRecipes.length} results',
          );
        },
        failure: (error) {
          // 에러 발생 시 상태에 반영하거나 로깅
          print('Error fetching recipes: $error');
          _state = state.copyWith(resultLabel: 'Failed to fetch recipes');
        },
      );
    } catch (e) {
      print('Unexpected error: $e');
      _state = state.copyWith(resultLabel: 'Unexpected error occurred');
    }

    _state = state.copyWith(isLoading: false);
    notifyListeners();
  }

  void search(String query) {
    final filteredRecipes = state.originalRecipes
      .where(
        (e) =>
          e.name.toLowerCase().contains(query.toLowerCase()) ||
          e.chef.toLowerCase().contains(query.toLowerCase()),
      )
      .toList();

    _state = state.copyWith(
      query: query,
      searchLabel: state.originalRecipes.length == filteredRecipes.length
        ? 'Recent Search'
        : 'Search Result',
      filteredRecipes: filteredRecipes,
      resultLabel: '${filteredRecipes.length} results',
    );
    notifyListeners();
  }

  void filter(FilterSearchState filterSearchState){
    // 인자 : 사용자가 선택한 filter 값 전달 받음

    // print('[DEBUG] 필터 적용: $filterSearchState');

    _state = state.copyWith(
      filterSearchState: filterSearchState,
      // 인자로 전달받은 값을 filterSearchState 변수에 저장
      filteredRecipes: state.originalRecipes
        .where((e) => e.rating.toInt() == filterSearchState.rate).toList(),
    );

    // 순차적으로 필터를 누적하는 방식
    switch (filterSearchState.time){
      case 'All' :
        break;
      case 'Newest' :
        _state = state.copyWith(
          filteredRecipes: state.filteredRecipes.sorted(
            // originalRecipes 을 쓰면 리스트가 originalRecipes 기준으로 다시 필터링 되기 때문에
            // filteredRecipes를 사용해서 필터링을 누적하는 방식
            (a, b) => b.time.compareTo(a.time),
          ),
        );
        break;
      case 'Oldest' :
        _state = state.copyWith(
          filteredRecipes: state.filteredRecipes.sorted(
            (a, b) => a.time.compareTo(b.time),
          ),
        );
        break;
      case 'Populariry' :
        break;
    }
    notifyListeners();
  }
}
