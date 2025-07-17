import 'dart:convert';

import '../model/recipe.dart';
import 'package:http/http.dart' as http;

class RecipesRepository {
  Future<List<Recipe>> fetchRecipes() async {
    final response = await http.get(
        Uri.parse('https://raw.githubusercontent.com/junsuk5/mock_json/refs/heads/main/recipe/recipes.json')
    );

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body)['recipes'];
      final List<dynamic> recipes = decoded;

      return recipes.map((e) => Recipe.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load recipes');
    }
  }
}
