import 'dart:async';

import 'package:flutter_recipe_app/feature/saved_recipes/data/data_source/bookmark_data_source.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/data/mapper/bookmark_mapper.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/domain/model/bookmark.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/domain/repository/bookmark_repository.dart';

class BookmarkRepositoryImpl implements BookmarkRepository {
  final BookmarkDataSource _localBookmarkDataSource;
  final List<Bookmark> _cache = [];
  final StreamController<List<Bookmark>> _streamController =
      StreamController.broadcast();

  BookmarkRepositoryImpl({required BookmarkDataSource localBookmarkDataSource})
    : _localBookmarkDataSource = localBookmarkDataSource;

  @override
  Stream<List<Bookmark>> fetchBookmarks() async* {
    final bookmarks = await _localBookmarkDataSource.findBookmarks();
    _cache
      ..clear()
      ..addAll(bookmarks.map((e) => e.toModel()));
    yield _cache;

    yield* _streamController.stream;
  }

  @override
  Future<bool> saveBookmark(String id) async {
    final bookmark = Bookmark(id: 0, recipeId: id);
    final result = await _localBookmarkDataSource.insertBookmark(
      bookmark.toDto(),
    );

    if (result > 0) {
      _cache.add(bookmark.copyWith(id: result));
      _streamController.add(List.of(_cache));
      return true;
    }

    return false;
  }

  @override
  Future<int> removeBookmarks(String id) async {
    try {
      final bookmarkToRemove = _cache.firstWhere(
        (bookmark) => bookmark.recipeId == id,
      );
      final result = await _localBookmarkDataSource.deleteBookmark(
        bookmarkToRemove.toDto(),
      );

      if (result > 0) {
        _cache.removeWhere((bookmark) => bookmark.recipeId == id);
        _streamController.add(List.of(_cache));
      }

      return result;
    } on StateError {
      return 0;
    }
  }
}
