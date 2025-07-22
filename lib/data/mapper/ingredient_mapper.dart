import '../dto/recipe_dto.dart';
import '../model/ingredient.dart' as model;

extension IngredientsToMapper on Ingredients {
  model.Ingredient toModel() {
    return model.Ingredient(
      name: ingredient?.name ?? '',
      image: ingredient?.image ?? '',
      amount: amount?.toString() ?? '500g',
    );
  }
}
