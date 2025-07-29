import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/repository/bookmark_repository.dart';
import 'package:rxdart/rxdart.dart';

class MockBookMarkRepositoryImpl implements BookmarkRepository {
  final List<int> _bookmarkRecipeIds = [];
  final BehaviorSubject<void> _bookmarkSubject = BehaviorSubject<void>();

  MockBookMarkRepositoryImpl();

  @override
  Future<Result<List<int>, String>> getBookmarkRecipesId() async {
    return Success(_bookmarkRecipeIds);
  }

  @override
  Future<Result<void, String>> addBookmarkRecipe(int recipeId) async {
    _bookmarkRecipeIds.add(recipeId);
    _bookmarkSubject.add(null);
    return Success(null);
  }

  @override
  Future<Result<void, String>> removeBookmarkRecipe(int recipeId) async {
    _bookmarkRecipeIds.remove(recipeId);
    _bookmarkSubject.add(null);
    return Success(null);
  }

  @override
  Stream<void> getBookmarkChangedStream() {
    return _bookmarkSubject.stream;
  }
}