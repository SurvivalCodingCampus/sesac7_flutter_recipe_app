import 'package:http/http.dart';

import '../core/api_response.dart';

abstract interface class RecipeDataSource {
  Future<ApiResponse<String>> getRecipes();
}