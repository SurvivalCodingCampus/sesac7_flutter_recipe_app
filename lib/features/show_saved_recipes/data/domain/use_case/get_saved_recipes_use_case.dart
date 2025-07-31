import '../../../../../core/data/recipe/domain/model/recipe.dart';
import '../../../../../data/bookmark/domain/repository/mock_bookmark_repository.dart';

class GetSavedRecipesUseCase {
  final MockBookmarkRepository _bookmarkRepository;

  const GetSavedRecipesUseCase({
    required MockBookmarkRepository bookmarkRepository,
  }) : _bookmarkRepository = bookmarkRepository;

  List<Recipe>? execute() {
    return _bookmarkRepository.getSavedRecipes();
  }
}
