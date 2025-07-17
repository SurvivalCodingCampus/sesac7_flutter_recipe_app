import 'dart:convert';

import 'package:flutter_recipe_app/core/response.dart';
import 'package:flutter_recipe_app/data/data_source/recipe/recipe_data_source.dart';
import 'package:flutter_recipe_app/data/dto/recipe/recipe_dto.dart';
import 'package:flutter_recipe_app/data/dto/recipe/recipe_list_dto.dart';
import 'package:http/http.dart' as http;

class RecipeDataSourceImpl implements RecipeDataSource {
  static const String _baseUrl =
      'https://raw.githubusercontent.com/junsuk5/mock_json/refs/heads/main/recipe/recipes.json';
  static const Map<String, String> _headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  final http.Client _client;

  RecipeDataSourceImpl({required http.Client client}) : _client = client;

  @override
  Future<Response<List<RecipeDto>>> fetchAllRecipes() async {
    final response = await _client.get(Uri.parse(_baseUrl), headers: _headers);

    return Response<List<RecipeDto>>(
      statusCode: response.statusCode,
      headers: response.headers,
      body: RecipeListDto.fromJson(jsonDecode(response.body)).recipes ?? [],
    );
  }
}
