import 'package:flutter_recipe_app/feature/ingredient/domain/repository/procedure_repository.dart';

class MockProcedureRepositoryImpl implements ProcedureRepository {
  @override
  Future<List<String>> fetchProcedure(String recipeId) async {
    return [
      'Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum dolore eu fugiat nulla pariatur?',
      'Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum dolore eu fugiat nulla pariatur?\nTempor incididunt ut labore et dolore,in voluptate velit esse cillum dolore eu fugiat nulla pariatur?',
      'Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum dolore eu fugiat nulla pariatur?',
    ];
  }
}
