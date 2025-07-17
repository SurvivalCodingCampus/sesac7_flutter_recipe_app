import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient.freezed.dart';

part 'ingredient.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
class Ingredient with _$Ingredient {
  @override
  final int id;
  @override
  final String name;
  @override
  final String image;

  const Ingredient({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Ingredient.fromJson(Map<String, Object?> json) =>
      _$IngredientFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientToJson(this);
}
