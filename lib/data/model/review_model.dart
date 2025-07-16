import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_model.freezed.dart';

part 'review_model.g.dart';

@freezed
abstract class ReviewModel with _$ReviewModel {
  const factory ReviewModel({
    required String id, // 리뷰 ID
    required String recipeId, // 해당 레시피 ID
    required String userId, // 리뷰 작성자 ID
    String? userProfileImageUrl, // 리뷰 작성자 프로필 이미지 URL
    required int rating, // 별점 (1~5)
    required String comment, // 리뷰 내용
    required DateTime timestamp, // 작성시간
  }) = _ReviewModel;

  factory ReviewModel.fromJson(Map<String, Object?> json) => _$ReviewModelFromJson(json);
}
