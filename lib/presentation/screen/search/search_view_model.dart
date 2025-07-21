import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/data/model/recipe.dart';
import 'package:flutter_recipe_app/data/repository/recipe_repository.dart';
import 'package:flutter_recipe_app/presentation/screen/search/search_state.dart';

class SearchViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  SearchViewModel({required recipeRepository})
    : _recipeRepository = recipeRepository;

  //필요한 것들
  //키워드 입력하는 검색창
  //검색시작하는 버튼
  //현재 리스트가 뭘 보여주는 알려주는 텍스트
  //검색결과 갯수
  //스크롤뷰안에 있는 카드리스트
  //카드리스트를 필터링하는 옵션

  //변수
  SearchState _state = const SearchState();

  SearchState get state => _state;

  //검색된 리스트 가져오기
  Future<void> fetchSearchResult(String keyword) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    Result<List<Recipe>> result = await _recipeRepository.getRecipesWithKeyword(
      keyword,
    );

    switch (result) {
      case Success<List<Recipe>>():
        _state = state.copyWith(recipes: result.value, keyword: keyword);

      case Error<List<Recipe>>():
        _state = state.copyWith(
          recipes: [],
          errorMessage: result.message,
          keyword: keyword,
        );
    }

    _state = state.copyWith(isLoading: false);
    notifyListeners();
  }

  void onKeywordChanged(String newKeyword) {
    // 현재 상태를 복사하되, keyword만 새로운 값으로 교체
    _state = state.copyWith(keyword: newKeyword);

    fetchSearchResult(newKeyword);
    //notifyListeners();
  }
}
