import 'package:flutter_recipe_app/core/response.dart';

abstract interface class RecipeDataSource {
  //api를 통해서 json을 받는다.
  //http client가 필요하다.
  //제대로 못 받는 경우를 고려해서, Reponse객체를 만들어 결과를 처리한다.

  Future<Response> getRecipes();
}
