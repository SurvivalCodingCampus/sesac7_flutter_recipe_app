import '../dto/recipe_dto.dart';
import '../model/ingredient.dart';
import '../model/recipe.dart';

extension DtoToModel on RecipeDto {
  Recipe toModel(int id) {
    final result = recipes?.where((e) => e.id == id).toList();

    final int convertedId;
    final double convertedRating;

    if (result?.first.id is int) {
      convertedId = result?.first.id as int;
    } else {
      convertedId = -1;
    }

    if (result?.first.rating is double) {
      convertedRating = result?.first.rating as double;
    } else {
      convertedRating = -1.0;
    }

    return Recipe(
      category: result?.first.category ?? 'unknown',
      id: convertedId,
      name: result?.first.name ?? 'unknown',
      image: result?.first.image ?? 'unknown',
      chef: result?.first.chef ?? 'unknown',
      cookingTime: result?.first.time ?? 'unknown',
      rating: convertedRating,
      ingredients:
          result?.first.ingredients
              ?.map(
                (dtoIngredient) => Ingredient(
                  id:
                      dtoIngredient.ingredient?.id?.toInt() ??
                      -1, // num? -> int 변환
                  name: dtoIngredient.ingredient?.name ?? 'unknown',
                  image: dtoIngredient.ingredient?.image ?? 'unknown',
                ),
              )
              .toList() ??
          [],
    );
  }
}

/*
String? category;
  num? id;
  String? name;
  String? image;
  String? chef;
  String? time;
  num? rating;

  List<Ingredients>? ingredients;

    EachIngredient? ingredient;

      num? id;
      String? name;
      String? image;

    num? amount;


 */
