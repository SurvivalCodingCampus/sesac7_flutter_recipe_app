import 'package:http/http.dart';

abstract interface class RecipeDataSource {
  Future<Response> getRecipes();
}