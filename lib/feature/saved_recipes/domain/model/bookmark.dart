import 'package:freezed_annotation/freezed_annotation.dart';

part "bookmark.freezed.dart";

@freezed
abstract class Bookmark with _$Bookmark {
  const factory Bookmark({
    required int id,
    required String recipeId,
  }) = _Bookmarks;
}
