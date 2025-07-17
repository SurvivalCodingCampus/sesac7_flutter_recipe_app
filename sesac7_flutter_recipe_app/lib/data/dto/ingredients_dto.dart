import 'ingredient_dto.dart';

class IngredientsDto {
  IngredientsDto({
    this.ingredient,
    this.amount,
  });

  IngredientsDto.fromJson(dynamic json) {
    ingredient = json['ingredient'] != null
        ? IngredientDto.fromJson(json['ingredient'])
        : null;
    amount = json['amount'];
  }

  IngredientDto? ingredient;
  num? amount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (ingredient != null) {
      map['ingredient'] = ingredient?.toJson();
    }
    map['amount'] = amount;
    return map;
  }
}
