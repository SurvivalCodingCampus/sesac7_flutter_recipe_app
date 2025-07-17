import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required String id, // 사용자 ID
    required String email, // 이메일 주소
    required String password, // 비밀번호
    required String name, // 사용자 이름
    required String profileImageUrl, // 프로필 이미지 URL
    required List<String> savedRecipeIds, // 저장된 레시피 ID 목록 -> UnSave 관련
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) => _$UserModelFromJson(json);
}
