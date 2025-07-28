import '../../core/routing/network_error.dart';
import '../../core/routing/result.dart';

abstract interface class RecipeRepository {
  Future<Result<List<Recipe>, NetworkError>> getRecipes();
}
