import 'package:flutter_recipe_app/01_stateless/core/response.dart';
import 'package:flutter_recipe_app/01_stateless/data/data_source/recipe_data_source.dart';
import 'package:http/http.dart' as http;

class RecipeDataSourceImpl implements RecipeDataSource {
  final String _baseUrl;

  final http.Client _client;

  RecipeDataSourceImpl({http.Client? client, String? baseUrl})
    : _client = client ?? http.Client(),
      _baseUrl =
          baseUrl ??
          'https://raw.githubusercontent.com/junsuk5/mock_json/refs/heads/main';

  @override
  Future<Response> getRecipes() async {
    final response = await _client.get(
      Uri.parse('$_baseUrl/recipe/recipes.json'),
    );
    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: response.body,
    );
  }
}
