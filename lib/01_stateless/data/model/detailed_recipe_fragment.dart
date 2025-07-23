import 'package:flutter_recipe_app/01_stateless/data/model/ingredient.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'detailed_recipe_fragment.freezed.dart';

@freezed
abstract class DetailedRecipeFragment with _$DetailedRecipeFragment {
  const factory DetailedRecipeFragment({
    required int id,
    required int authorId,
    required List<String> procedures,
    required List<Ingredient> ingredients,
    required int reviewCount,

  }) = _DetailedRecipeFragment;

}