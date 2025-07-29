import 'package:flutter_recipe_app/core/data/recipe/domain/model/recipe.dart';
import 'package:flutter_recipe_app/features/search_recipes/data/domain/repository/mock_search_history_repository.dart';

class GetSearchHistoriesUseCase {
  final MockSearchHistoryRepository _searchHistoryRepository;

  const GetSearchHistoriesUseCase({
    required MockSearchHistoryRepository searchHistoryRepository,
  }) : _searchHistoryRepository = searchHistoryRepository;

  List<Recipe> execute() {
    return _searchHistoryRepository.getSearchHistories();
  }
}
