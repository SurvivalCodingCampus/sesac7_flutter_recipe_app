class RecipesIngredientsDto {
  RecipesIngredientsDto({
    this.recipesIngredients,
  });

  RecipesIngredientsDto.fromJson(dynamic json) {
    if (json['recipesIngredients'] != null) {
      recipesIngredients = [];
      json['recipesIngredients'].forEach((v) {
        recipesIngredients?.add(RecipesIngredients.fromJson(v));
      });
    }
  }

  List<RecipesIngredients>? recipesIngredients;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (recipesIngredients != null) {
      map['recipesIngredients'] = recipesIngredients
          ?.map((v) => v.toJson())
          .toList();
    }
    return map;
  }
}

class RecipesIngredients {
  RecipesIngredients({
    this.recipeId,
    this.ingredientId,
    this.amount,
  });

  RecipesIngredients.fromJson(dynamic json) {
    recipeId = json['recipeId'];
    ingredientId = json['ingredientId'];
    amount = json['amount'];
  }

  num? recipeId;
  num? ingredientId;
  num? amount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['recipeId'] = recipeId;
    map['ingredientId'] = ingredientId;
    map['amount'] = amount;
    return map;
  }
}
