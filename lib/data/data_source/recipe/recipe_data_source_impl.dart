import 'dart:convert';

import 'package:flutter_recipe_app/core/response.dart';

import 'package:flutter_recipe_app/data/data_source/recipe/recipe_data_source.dart';
import 'package:flutter_recipe_app/data/dto/recipe/recipe_dto.dart';
import 'package:http/http.dart' as http;

class RecipeDataSourceImpl implements RecipeDataSource {
  final String baseUrl;
  final http.Client _client;

  RecipeDataSourceImpl({http.Client? client, required this.baseUrl})
    : _client = client ?? http.Client();

  @override
  Future<Response<List<RecipeDto>>> getRecipes() async {
    try {
      final response = await _client.get(Uri.parse(baseUrl));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final Map<String, dynamic> decodedJson = jsonDecode(response.body);
        final List<dynamic> recipesJsonList =
            decodedJson['recipes'] as List<dynamic>;

        final List<RecipeDto> recipeDtos = recipesJsonList
            .map((e) => RecipeDto.fromJson(e as Map<String, dynamic>))
            .toList();

        return Response(
          statusCode: response.statusCode,
          header: response.headers,
          body: recipeDtos,
        );
      } else {
        return Response(
          statusCode: response.statusCode,
          header: response.headers,
          body: [],
        );
      }
    } catch (e) {
      print("Error fetching recipes: $e");
      return Response(statusCode: 500, header: {}, body: []);
    }
  }
}
