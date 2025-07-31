
import 'dart:async';

import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/repository/bookmark_repository.dart';

class MockBookmarkRepository implements BookmarkRepository {
  final Result<void, String> _addResult;
  final Result<void, String> _removeResult;
  final Result<List<int>, String> _getIdsResult;
  final Stream<void> _bookmarkChangedStream;

  MockBookmarkRepository({
    required Result<void, String> addResult,
    required Result<void, String> removeResult,
    required Result<List<int>, String> getIdsResult,
    required Stream<void> bookmarkChangedStream,
  })
      : _addResult = addResult,
        _removeResult = removeResult,
        _getIdsResult = getIdsResult,
        _bookmarkChangedStream = bookmarkChangedStream;

  @override
  Future<Result<void, String>> addBookmarkRecipe(int recipeId) async {
    return _addResult;
  }

  @override
  Stream<void> getBookmarkChangedStream() {
    return _bookmarkChangedStream;
  }

  @override
  Future<Result<List<int>, String>> getBookmarkRecipesId() async {
    return _getIdsResult;
  }

  @override
  Future<Result<void, String>> removeBookmarkRecipe(int recipeId) async {
    return _removeResult;
  }
}
