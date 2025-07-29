import 'dart:convert';

import 'package:flutter_recipe_app/data/data_source/recipe_data_source.dart';

import '../../core/routing/response.dart';
import 'package:http/http.dart' as http;

import '../dto/recipes_dto.dart';

class RecipeDataSourceImpl implements RecipeDataSource {
  final _baseUrl =
      'https://raw.githubusercontent.com/junsuk5/mock_json/main/recipe/recipes.json';

  final http.Client _client;

  RecipeDataSourceImpl({http.Client? client})
    : _client = client ?? http.Client();

  @override
  Future<Response<RecipesDto>> getRecipes() async {
    final response = await _client.get(Uri.parse(_baseUrl));

    final jsonMap = jsonDecode(response.body) as Map<String, dynamic>;

    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: RecipesDto.fromJson(jsonMap), // RecipesResultDto
    );
  }
}
