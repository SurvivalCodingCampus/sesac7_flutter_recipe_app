import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/repository/procedure_repository.dart';

import '../model/step_Info.dart';

class GetProcedureUseCase {
  final ProcedureRepository _procedureRepository;

  GetProcedureUseCase({
    required ProcedureRepository procedureRepository,
  }) : _procedureRepository = procedureRepository;

  Future<List<StepInfo>> getSteps(String recipeId) async {
    final result = await _procedureRepository.getStepInfos(recipeId);
    switch (result) {
      case Success<List<StepInfo>, String>():
        return result.value;
      case Failure<List<StepInfo>, String>():
        print(result.exception);
        return [];
    }
  }
}