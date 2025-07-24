import '../dto/recipe_dto.dart';
import '../model/ingredient.dart';
import '../model/recipe.dart';

extension DtoToModel on RecipeDto {
  Recipe toModel(int id) {
    final result = recipes?.where((e) => e.id == id).toList();

    final int convertedId;
    final List<int> convertedAmount = [];
    final double convertedRating;
    int index = 0;

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

    // Recipe에 포함된 ingredient가 없을 경우 해당 경로 실행
    if (result?.first.ingredients == null) {
      return Recipe(
        category: result?.first.category ?? 'unknown',
        id: convertedId,
        name: result?.first.name ?? 'unknown',
        image: result?.first.image ?? 'unknown',
        chef: result?.first.chef ?? 'unknown',
        cookingTime: result?.first.time ?? 'unknown',
        rating: convertedRating,
        ingredients: [],
      );
    }

    for (var i = 0; i < result!.first.ingredients!.length; i++) {
      if (result.first.ingredients?.first.amount is int) {
        convertedAmount.add(result.first.ingredients?[i].amount as int);
      } else {
        convertedAmount.add(-1);
      }
    }

    return Recipe(
      category: result.first.category ?? 'unknown',
      id: convertedId,
      name: result.first.name ?? 'unknown',
      image: result.first.image ?? 'unknown',
      chef: result.first.chef ?? 'unknown',
      cookingTime: result.first.time ?? 'unknown',
      rating: convertedRating,
      ingredients:
          result.first.ingredients
              ?.map(
                (dtoIngredient) => Ingredient(
                  id:
                      dtoIngredient.ingredient?.id?.toInt() ??
                      -1, // num? -> int 변환
                  name: dtoIngredient.ingredient?.name ?? 'unknown',
                  image: dtoIngredient.ingredient?.image ?? 'unknown',
                  amount: convertedAmount[index++],
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
