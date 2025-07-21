import '../dto/recipes_response_dto.dart';
import '../model/recipe.dart';

extension RecipesDtoToRecipes on RecipesResponseDto {
  List<Recipe> toRecipes() {
    return recipes?.map((dto) => dto.toModel()).toList() ?? [];
  }
}

extension RecipeDtoToModel on RecipeDto {
  Recipe toModel() {
    return Recipe(
      category: category ?? '',
      id: id?.toInt() ?? 0,
      name: name ?? '',
      imageUrl: image ?? '',
      chef: chef ?? '',
      time: time ?? '',
      rating: rating?.toDouble() ?? 0,
      createdAt: DateTime.now(),
    );
  }
}
