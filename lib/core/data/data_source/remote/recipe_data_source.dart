import '../../../response.dart';
import '../../dto/recipe_dto.dart';

abstract interface class RecipeDataSource {
  // dataSource 가 Response 를 리턴하도록 해야 외부에서 statusCode 확인도 가능
  Future<Response<RecipeDto>> fetchRecipes();
}