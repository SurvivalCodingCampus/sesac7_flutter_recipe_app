import 'package:flutter_recipe_app/domain/repository/procedure_repository.dart';

import '../model/step_Info.dart';

class GetProcedureUseCase {
  final ProcedureRepository _procedureRepository;

  GetProcedureUseCase({
    required ProcedureRepository procedureRepository,
  }) : _procedureRepository = procedureRepository;

  List<StepInfo> getSteps() {
    return _procedureRepository.getStepInfos();
  }
}