import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/recipe.dart';
import 'filter_search_bottom_sheet_state.dart';

part 'search_recipes_screen_state.freezed.dart';

@freezed
abstract class SearchRecipesScreenState with _$SearchRecipesScreenState {
  const factory SearchRecipesScreenState({
    @Default([]) List<Recipe> recipes, // 전체 레시피 목록
    @Default([]) List<Recipe> searchedResult, // 검색 결과물
    @Default([]) List<Recipe> filteredResult, // 필터가 적용된 결과물
    @Default('') String query, // 검색어
    @Default(false) bool isLoading, // 로딩 중인지를 표시
    @Default(false) bool isInit,
    @Default('Recent Search') String searchLabel,
    @Default('') String countingLabel,
    @Default(FilterSearchBottomSheetState())
    FilterSearchBottomSheetState filterSearchState,
  }) = _SearchRecipesScreenState;
}
