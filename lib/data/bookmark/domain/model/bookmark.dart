import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/data/recipe/domain/model/recipe.dart';

part 'bookmark.freezed.dart';
part 'bookmark.g.dart';

@freezed
abstract class Bookmark with _$Bookmark {
  const factory Bookmark({
    required List<Recipe> bookmarkedRecipes,
  }) = _Bookmark;

  factory Bookmark.fromJson(Map<String, Object?> json) =>
      _$BookmarkFromJson(json);
}
