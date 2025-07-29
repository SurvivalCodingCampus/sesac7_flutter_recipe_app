import 'package:flutter_recipe_app/feature/saved_recipes/domain/repository/bookmark_repository.dart';

class RemoveBookmarkUseCase {
  final BookmarkRepository _bookmarkRepository;

  RemoveBookmarkUseCase({required BookmarkRepository bookmarkRepository})
    : _bookmarkRepository = bookmarkRepository;

  void execute(String recipeId) {
    _bookmarkRepository.removeBookmarks(recipeId);
  }
}
