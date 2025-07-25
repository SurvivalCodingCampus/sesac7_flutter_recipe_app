import 'package:flutter_recipe_app/core/enum/network_error.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/model/procedure.dart';

abstract interface class ProcedureRepository {
  Future<Result<List<Procedure>, NetworkError>> getProcedures(int recipeId);
}