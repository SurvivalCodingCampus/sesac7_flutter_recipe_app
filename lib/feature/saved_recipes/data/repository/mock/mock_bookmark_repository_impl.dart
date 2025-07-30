import 'dart:async';

import 'package:flutter_recipe_app/feature/saved_recipes/domain/repository/bookmark_repository.dart';

class MockBookmarkRepositoryImpl implements BookmarkRepository {
  final _bookmarks = {'1', '2', '5'};
  final StreamController<List<String>> _streamController =
      StreamController.broadcast();

  @override
  Stream<List<String>> fetchBookmarks() async* {
    yield _bookmarks.toList();
    yield* _streamController.stream;
  }

  @override
  Future<void> saveBookmark(String id) async {
    _bookmarks.add(id);
    _streamController.add(_bookmarks.toList());
  }

  @override
  Future<void> removeBookmarks(String id) async {
    _bookmarks.removeWhere((e) => e == id);
    _streamController.add(_bookmarks.toList());
  }
}
