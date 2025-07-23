import 'dart:convert';

import 'package:flutter_recipe_app/data/data_source/recipe_data_source.dart';
import 'package:flutter_recipe_app/data/model/recipe.dart';
import 'package:flutter_recipe_app/data/recipe_dto/recipe_dto.dart';
import 'package:http/http.dart' as http;

class RecipeDataSourceImpl implements RecipeDataSource {
  final http.Client _client;

  RecipeDataSourceImpl({http.Client? client}) : _client = client ?? http.Client();

  @override
  Future<List<RecipeDto>> getSavedRecipeDtos() async {
    final url =
        'https://raw.githubusercontent.com/junsuk5/mock_json/refs/heads/main/recipe/recipes.json';
    final response = await _client.get(Uri.parse(url));

    return (jsonDecode(response.body)['recipes'] as List)
        .map((json) => RecipeDto.fromJson(json))
        .toList();
  }

}
