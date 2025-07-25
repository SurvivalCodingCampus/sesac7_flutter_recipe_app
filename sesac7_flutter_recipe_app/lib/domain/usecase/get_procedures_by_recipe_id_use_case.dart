import 'package:flutter_recipe_app/core/enum/network_error.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/model/procedure.dart';
import 'package:flutter_recipe_app/domain/repository/procedure_repository.dart';

class GetProceduresByRecipeIdUseCase {
  final ProcedureRepository _procedureRepository;

  const GetProceduresByRecipeIdUseCase({
    required ProcedureRepository procedureRepository,
  }) : _procedureRepository = procedureRepository;

  Future<Result<List<Procedure>, NetworkError>> execute(int recipeId) async {
    final Result<List<Procedure>, NetworkError> result =
        await _procedureRepository.getProcedures(recipeId);
    switch (result) {
      case Success<List<Procedure>, NetworkError>():
        final List<Procedure> procedures = result.data;
        final List<Procedure> filteredProcedures = procedures
            .where((procedure) => procedure.recipeId == recipeId)
            .toList();
        return Success(filteredProcedures);
      case Error<List<Procedure>, NetworkError>():
        return result;
    }
  }
}
