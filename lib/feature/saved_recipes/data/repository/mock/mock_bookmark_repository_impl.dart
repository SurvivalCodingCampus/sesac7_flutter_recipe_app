import 'package:flutter_recipe_app/feature/saved_recipes/domain/repository/bookmark_repository.dart';

class MockBookmarkRepositoryImpl implements BookmarkRepository {
  var _bookmarks = ['1', '2', '5'];

  @override
  Future<List<String>> fetchBookmarks() async {
    return _bookmarks;
  }

  @override
  Future<void> updateBookmarks(List<String> bookmarks) async {
    _bookmarks = bookmarks;
  }
}
