import '../model/recipe_ingredient.dart';
import '../repository/ingrident_repository.dart';

class GetIngredientsUseCase {
  final IngridentRepository _ingridentRepository;

  GetIngredientsUseCase({
    required IngridentRepository ingridentRepository,
  }) : _ingridentRepository = ingridentRepository;

  List<RecipeIngredient> getIngredients() {
    return _ingridentRepository.getIngredients();
  }

}