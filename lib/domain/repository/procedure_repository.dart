import 'package:flutter_recipe_app/domain/model/step_Info.dart';

abstract interface class ProcedureRepository {
  List<StepInfo> getStepInfos();
}