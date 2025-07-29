import 'package:flutter_recipe_app/feature/saved_recipes/domain/repository/bookmark_repository.dart';

class SaveBookmarkUseCase {
  final BookmarkRepository _bookmarkRepository;

  SaveBookmarkUseCase({required BookmarkRepository bookmarkRepository})
    : _bookmarkRepository = bookmarkRepository;

  void execute(String recipeId) {
    _bookmarkRepository.saveBookmark(recipeId);
  }
}
