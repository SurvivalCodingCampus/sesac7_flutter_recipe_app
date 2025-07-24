import 'package:flutter_recipe_app/domain/model/step_Info.dart';

import '../../core/result.dart';

abstract interface class ProcedureRepository {
  Future<Result<List<StepInfo>, String>> getStepInfos(String recipeId);
}