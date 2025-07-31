
import 'package:flutter_recipe_app/core/enum/network_error.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/domain/usecase/get_recipes_use_case.dart';

class MockGetRecipesUseCase implements GetRecipesUseCase {
  final Result<List<Recipe>, NetworkError> _result;

  MockGetRecipesUseCase(this._result);

  @override
  Future<Result<List<Recipe>, NetworkError>> execute() async {
    return _result;
  }
}
