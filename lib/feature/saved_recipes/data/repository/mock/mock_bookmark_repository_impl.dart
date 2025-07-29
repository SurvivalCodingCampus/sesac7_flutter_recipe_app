import 'package:flutter_recipe_app/feature/saved_recipes/domain/repository/bookmark_repository.dart';

class MockBookmarkRepositoryImpl implements BookmarkRepository {
  final _bookmarks = {'1', '2', '5'};

  @override
  Stream<List<String>> fetchBookmarks() async* {
    yield _bookmarks.toList();
  }

  @override
  Future<void> saveBookmark(String id) async {
    _bookmarks.add(id);
  }

  @override
  Future<void> removeBookmarks(String id) async {
    _bookmarks.removeWhere((e) => e == id);
  }
}
