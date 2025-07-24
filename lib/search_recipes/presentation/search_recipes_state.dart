import 'package:freezed_annotation/freezed_annotation.dart';
import '../../core/domain/model/recipe.dart';
import '../../core/presentation/component/bottom_sheet/filter_search_state.dart';

part 'search_recipes_state.freezed.dart';

@freezed
abstract class SearchRecipesState with _$SearchRecipesState {
  const factory SearchRecipesState({
    @Default('') String query,
    @Default('Recent Search') String searchLabel,
    @Default('255 results') String resultLabel,
    @Default([]) List<Recipe> originalRecipes,
    @Default([]) List<Recipe> filteredRecipes,
    @Default(FilterSearchState()) FilterSearchState filterSearchState,
    @Default(false) bool isLoading,
  }) = _SearchRecipesState;

  // 일반 생성자 : 무조건 새로운 인스턴스 생성
  // factory 생성자 : 기존 인스턴스 재사용, 조건에 따라 다른 인스턴스 반환, 내부에서 생성자 말고도 다른 방식으로도 객체 생성 가능(fromJson 같은 경우)
  factory SearchRecipesState.initial() => const SearchRecipesState(
    query: '',
    searchLabel: 'Recent Search',
    resultLabel: '',
    originalRecipes: [],
    filteredRecipes: [],
    filterSearchState: FilterSearchState(),
    isLoading: false,
  );
}