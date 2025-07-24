import 'dart:convert';

import 'package:flutter_recipe_app/data/data_source/recipe_data_source.dart';
import 'package:http/http.dart' as http;

import '../dto/recipe_dto.dart';

class RecipeDataSourceImpl implements RecipeDataSource {
  static const String defaultUrl =
      'https://raw.githubusercontent.com/junsuk5/mock_json/refs/heads/main/recipe/recipes.json';

  final http.Client _client;

  RecipeDataSourceImpl({http.Client? client})
    : _client = client ?? http.Client();

  @override
  Future<List<RecipeDto>> getAllRecipes() async {
    final response = await _client.get(Uri.parse(defaultUrl));

    if (response.statusCode != 200) {
      throw Exception('Failed to load recipes');
    }

    return (jsonDecode(response.body)['recipes'] as List)
        .map((e) => RecipeDto.fromJson(e))
        .toList();
  }
}

void main() async {
  final dataSource = RecipeDataSourceImpl();
  final result = await dataSource.getAllRecipes();

  print(result);
}
