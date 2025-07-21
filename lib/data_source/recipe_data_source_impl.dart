import 'package:flutter_recipe_app/data_source/recipe_data_source.dart';
import 'package:http/http.dart' as http;

import '../core/api_response.dart';

class RecipeDataSourceImpl implements RecipeDataSource {
  final String _baseUrl;

  final http.Client _client;

  RecipeDataSourceImpl({http.Client? client, String? baseUrl})
      : _client = client ?? http.Client(),
        _baseUrl =
            baseUrl ??
                'https://raw.githubusercontent.com/junsuk5/mock_json/refs/heads/main';

  @override
  Future<ApiResponse<String>> getRecipes() async {
    final response = await _client.get(
      Uri.parse('$_baseUrl/recipe/recipes.json'),
    );
    return ApiResponse<String>(
      statusCode: response.statusCode,
      header: response.headers,
      body: response.body,
    );
  }
}