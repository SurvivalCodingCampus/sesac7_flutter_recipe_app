import 'package:flutter_recipe_app/feature/ingredient/domain/repository/procedure_repository.dart';

class MockProcedureRepositoryImpl implements ProcedureRepository {
  @override
  Future<List<String>> fetchProcedure(String recipeId) {
    // TODO: implement fetchProcedure
    throw UnimplementedError();
  }
}
