import '../../../../../core/data/recipe/domain/model/recipe.dart';
import '../repository/mock_search_history_repository.dart';

class AddSearchHistoryUseCase {
  final MockSearchHistoryRepository _searchHistoryRepository;

  const AddSearchHistoryUseCase({
    required MockSearchHistoryRepository searchHistoryRepository,
  }) : _searchHistoryRepository = searchHistoryRepository;

  void execute(List<Recipe> recipes) {
    _searchHistoryRepository.addSearchHistory(recipes);
  }
}
