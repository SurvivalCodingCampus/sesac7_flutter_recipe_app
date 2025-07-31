import '../../../../../core/data/recipe/domain/model/recipe.dart';
import '../../../../../data/bookmark/domain/repository/bookmark_repository.dart';

class GetSavedRecipesUseCase {
  final BookmarkRepository _bookmarkRepository;

  const GetSavedRecipesUseCase({
    required BookmarkRepository bookmarkRepository,
  }) : _bookmarkRepository = bookmarkRepository;

  List<Recipe>? execute() {
    return _bookmarkRepository.getSavedRecipes();
  }
}
