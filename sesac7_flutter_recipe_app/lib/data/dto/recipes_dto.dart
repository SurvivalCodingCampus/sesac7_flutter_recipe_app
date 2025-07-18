import 'recipe_dto.dart';

class RecipesDto {
  RecipesDto({
    this.recipes,
  });

  RecipesDto.fromJson(dynamic json) {
    if (json['recipes'] != null) {
      recipes = [];
      json['recipes'].forEach((v) {
        recipes?.add(RecipeDto.fromJson(v));
      });
    }
  }

  List<RecipeDto>? recipes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (recipes != null) {
      map['recipes'] = recipes?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
