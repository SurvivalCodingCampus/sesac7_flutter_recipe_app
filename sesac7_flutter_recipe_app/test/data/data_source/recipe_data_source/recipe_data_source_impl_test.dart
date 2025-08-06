
import 'package:flutter_recipe_app/data/data_source/remote/remote_recipe_data_source_impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RecipeDataSourceImpl', () {
    final dataSource = RemoteRecipeDataSourceImpl();

    test('getRecipes should return RecipesDto with correct data', () async {
      final response = await dataSource.getRecipes();

      expect(response.statusCode, 200);
      expect(response.body, isNotNull);
      expect(response.body.recipes?.length, 10);
      expect(response.body.recipes?[0].name, 'Traditional spare ribs baked');
      expect(response.body.recipes?[0].ingredients?.length, 4);
    });
  });
}
