import 'package:flutter_recipe_app/feature/saved_recipes/domain/model/bookmark.dart';

abstract interface class BookmarkRepository {
  Stream<List<Bookmark>> fetchBookmarks();
  Future<bool> saveBookmark(String id);
  Future<int> removeBookmarks(String id);
}
