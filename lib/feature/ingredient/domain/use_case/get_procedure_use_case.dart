import 'dart:async';

import 'package:flutter_recipe_app/core/utils/network_error.dart';
import 'package:flutter_recipe_app/core/utils/result.dart';
import 'package:flutter_recipe_app/feature/ingredient/domain/repository/procedure_repository.dart';

class GetProcedureUseCase {
  final ProcedureRepository _procedureRepository;

  GetProcedureUseCase({required ProcedureRepository procedureRepository})
    : _procedureRepository = procedureRepository;

  Future<Result<List<String>, NetworkError>> execute(
    String recipeId,
  ) async {
    try {
      final procedure = await _procedureRepository.fetchProcedure(
        recipeId,
      );

      return Result.success(procedure);
    } on TimeoutException {
      return Result.error(NetworkError.requestTimeout);
    } on FormatException {
      return Result.error(NetworkError.parseError);
    } on NetworkError catch (e) {
      return Result.error(e);
    } catch (e) {
      return Result.error(NetworkError.unknown);
    }
  }
}
