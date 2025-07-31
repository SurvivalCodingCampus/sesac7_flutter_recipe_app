
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/domain/usecase/get_saved_recipes_use_case.dart';

class MockGetSavedRecipesUseCase implements GetSavedRecipesUseCase {
  final Result<List<Recipe>, String> _result;

  MockGetSavedRecipesUseCase(this._result);

  @override
  Future<Result<List<Recipe>, String>> execute() async {
    return _result;
  }
}
