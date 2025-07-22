import 'dart:convert';

import 'package:flutter_recipe_app/data/data_source/remote/recipe_data_source.dart';
import 'package:http/http.dart' as http;

import '../../dto/recipe_dto.dart';
import '../../model/recipe.dart';

class RecipeDataSourceImpl implements RecipeDataSource {
  // final String baseUrl = 'https://raw.githubusercontent.com/junsuk5/mock_json/refs/heads/main/recipe/recipes.json';
  final String baseUrl;
  final http.Client _client;

  RecipeDataSourceImpl({http.Client? client, required this.baseUrl })
  : _client = client ?? http.Client();

  @override
  Future<RecipeDto> fetchRecipes() async {
    final response = await _client.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);
      return RecipeDto.fromJson(decoded);
    } else {
      throw Exception('Failed to load recipes');
    }
  }
}