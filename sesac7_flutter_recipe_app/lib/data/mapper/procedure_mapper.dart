import 'package:flutter_recipe_app/data/dto/procedure_dto.dart';
import 'package:flutter_recipe_app/domain/model/procedure.dart';

extension ProcedureDtoToModel on ProcedureDto {
  Procedure toModel() {
    return Procedure(
      recipeId: recipeId!.toInt(),
      step: step!.toInt(),
      content: content!,
    );
  }
}

extension ProcedureModelToDto on Procedure {
  ProcedureDto toDto() {
    return ProcedureDto(
      recipeId: recipeId,
      step: step,
      content: content,
    );
  }
}
