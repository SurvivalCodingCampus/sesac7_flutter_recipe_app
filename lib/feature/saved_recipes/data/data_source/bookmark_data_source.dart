import 'package:flutter_recipe_app/feature/saved_recipes/data/dto/bookmark_dto.dart';

abstract interface class BookmarkDataSource {
  Future<List<BookmarkDto>> findBookmarks();
  Future<int> deleteBookmark(BookmarkDto dto);
  Future<int> insertBookmark(BookmarkDto dto);
}
