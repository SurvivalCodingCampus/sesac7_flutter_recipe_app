
import 'package:flutter_recipe_app/core/enum/network_error.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/model/procedure.dart';
import 'package:flutter_recipe_app/domain/repository/procedure_repository.dart';

class MockProcedureRepository implements ProcedureRepository {
  final Result<List<Procedure>, NetworkError> _getProceduresResult;

  MockProcedureRepository({
    required Result<List<Procedure>, NetworkError> getProceduresResult,
  })
      : _getProceduresResult = getProceduresResult;

  @override
  Future<Result<List<Procedure>, NetworkError>> getProcedures(int recipeId) async {
    return _getProceduresResult;
  }
}
