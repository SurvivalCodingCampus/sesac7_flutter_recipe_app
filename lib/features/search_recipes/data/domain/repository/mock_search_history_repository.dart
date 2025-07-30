import '../../../../../core/data/recipe/domain/model/recipe.dart';

abstract interface class MockSearchHistoryRepository {
  List<Recipe> getSearchHistories();

  void addSearchHistory(List<Recipe> searchHistories);
}
