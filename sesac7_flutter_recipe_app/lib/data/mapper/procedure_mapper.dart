import 'package:flutter_recipe_app/data/dto/procedure_dto.dart';
import 'package:flutter_recipe_app/domain/model/procedure.dart';

extension ProcedureDtoToModel on ProcedureDto {
  Procedure toModel() {
    return Procedure(
      step: step!.toInt(),
      description: description!,
    );
  }
}

extension ProcedureModelToDto on Procedure {
  ProcedureDto toDto() {
    return ProcedureDto(
      step: step.toInt(),
      description: description,
    );
  }
}
