import 'package:flutter_recipe_app/core/response.dart';
import 'package:flutter_recipe_app/data/data_source/recipe_data_source.dart';
import 'package:http/http.dart' as http;

class RecipeDataSourceImpl implements RecipeDataSource {
  //api를 통해서 json을 받는다.
  //http client가 필요하다.
  //제대로 못 받는 경우를 고려해서, Reponse객체를 만들어 결과를 처리한다.

  final String _baseUrl;
  final http.Client _client;

  RecipeDataSourceImpl({String? baseUrl, http.Client? client})
    : _baseUrl =
          baseUrl ??
          'https://raw.githubusercontent.com/junsuk5/mock_json/refs/heads/main',
      _client = client ?? http.Client();

  @override
  Future<Response> getRecipes() async {
    final response = await _client.get(
      Uri.parse('$_baseUrl/recipe/recipes.json'),
    );

    return Response(
      statusCode: response.statusCode,
      headers: response.headers,
      body: response.body,
    );
  }
}

// void main() async {
//   final recipeDataSourceImpl = RecipeDataSourceImpl();
//
//   final reponse = await recipeDataSourceImpl.getRecipes();
//
//   print(reponse.body);
// }
