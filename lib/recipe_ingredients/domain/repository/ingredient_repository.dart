
import '../../../core/domain/model/ingredient.dart';

abstract interface class IngredientRepository {
  Future<List<Ingredient>> fetchIngredients(int recipeId);
}
