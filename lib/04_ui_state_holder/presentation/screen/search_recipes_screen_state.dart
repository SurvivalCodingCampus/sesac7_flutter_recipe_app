import 'package:flutter_recipe_app/02_stateful_widget/data/model/recipe.dart';
import 'package:flutter_recipe_app/04_ui_state_holder/presentation/screen/filter_search_bottom_sheet_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_recipes_screen_state.freezed.dart';
part 'search_recipes_screen_state.g.dart';

@freezed
abstract class SearchRecipesScreenState with _$SearchRecipesScreenState {
  const factory SearchRecipesScreenState({
    @Default([]) List<Recipe> recipes, // 전체 레시피 목록
    @Default([]) List<Recipe> recipesSearchedByName, // 이름으로 한 번 분류된 레시피 목록
    @Default([]) List<Recipe> recipesSearchedByChef, // 셰프 이름으로 한 번 분류된 레시피 목록
    @Default([]) List<Recipe> filteredRecipes,
    @Default([]) List<Recipe> searchedResult, // 최종 결과물
    @Default('') String query, // 검색어
    @Default(false) bool isLoading, // 로딩 중인지를 표시
    @Default(FilterSearchBottomSheetState())
    FilterSearchBottomSheetState filterSearchState,
  }) = _SearchRecipesScreenState;

  factory SearchRecipesScreenState.fromJson(Map<String, Object?> json) =>
      _$SearchRecipesScreenStateFromJson(json);
}
