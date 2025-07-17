import 'dart:convert';

import '../model/ingredient.dart';
import 'package:http/http.dart' as http;

class IngredientRepository {
  Future<List<Ingredient>> fetchIngredients() async {
    final response = await http.get(
        Uri.parse('https://raw.githubusercontent.com/junsuk5/mock_json/refs/heads/main/saved_recipes/ingredients.json')
    );

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body)['ingredients'];
      final List<dynamic> ingredients = decoded;

      return ingredients.map((e) => Ingredient.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load ingredients');
    }
  }
}
