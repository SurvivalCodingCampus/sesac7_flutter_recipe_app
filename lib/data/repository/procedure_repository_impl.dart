import 'package:flutter_recipe_app/domain/model/step_Info.dart';
import 'package:flutter_recipe_app/domain/repository/procedure_repository.dart';

import '../../domain/model/recipe.dart';

class ProcedureRepositoryImpl implements ProcedureRepository {

  final Recipe _recipe;

  ProcedureRepositoryImpl(this._recipe);

  @override
  List<StepInfo> getStepInfos() {
    return _recipe.steps;
  }

}