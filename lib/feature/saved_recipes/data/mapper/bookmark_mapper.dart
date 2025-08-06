import 'package:flutter_recipe_app/feature/saved_recipes/data/dto/bookmark_dto.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/domain/model/bookmark.dart';

extension BookmarkDtoToModel on BookmarkDto {
  Bookmark toModel() {
    return Bookmark(
      id: id ?? 0,
      recipeId: recipeId,
    );
  }
}

extension BookmarkModelToDto on Bookmark {
  BookmarkDto toDto() {
    return BookmarkDto(
      id: _id(),
      recipeId: recipeId,
    );
  }

  int? _id() {
    if (id == 0) return null;
    return id;
  }
}
