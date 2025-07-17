import 'recipe_dto.dart';

class RecipeListDto {
  List<RecipeDto>? recipes;

  RecipeListDto({this.recipes});

  factory RecipeListDto.fromJson(Map<String, dynamic> json) => RecipeListDto(
    recipes: (json['recipes'] as List<dynamic>?)
        ?.map((e) => RecipeDto.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'recipes': recipes?.map((e) => e.toJson()).toList(),
  };
}
