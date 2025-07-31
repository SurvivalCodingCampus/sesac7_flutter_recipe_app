import '../../../../../data/bookmark/domain/repository/mock_bookmark_repository.dart';

class DeleteBookmarkedRecipeUseCase {
  final MockBookmarkRepository _bookmarkRepository;

  const DeleteBookmarkedRecipeUseCase({
    required MockBookmarkRepository bookmarkRepository,
  }) : _bookmarkRepository = bookmarkRepository;

  void execute(int id) {
    _bookmarkRepository.deleteRecipe(id);
  }
}
