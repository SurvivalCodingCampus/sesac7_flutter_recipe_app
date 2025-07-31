import '../../../../../data/bookmark/domain/repository/bookmark_repository.dart';

class DeleteBookmarkedRecipeUseCase {
  final BookmarkRepository _bookmarkRepository;

  const DeleteBookmarkedRecipeUseCase({
    required BookmarkRepository bookmarkRepository,
  }) : _bookmarkRepository = bookmarkRepository;

  void execute(int id) {
    _bookmarkRepository.deleteRecipe(id);
  }
}
