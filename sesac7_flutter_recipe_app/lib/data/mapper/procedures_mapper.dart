import 'package:flutter_recipe_app/data/dto/procedures_dto.dart';
import 'package:flutter_recipe_app/data/mapper/procedure_mapper.dart';
import 'package:flutter_recipe_app/domain/model/procedures.dart';

extension ProceduresDtoToModel on ProceduresDto {
  Procedures toModel() {
    return Procedures(
      procedures:
          procedures?.map((procedureDto) => procedureDto.toModel()).toList() ??
          [],
    );
  }
}

extension ProceduresModelToDto on Procedures {
  ProceduresDto toDto() {
    return ProceduresDto(
      procedures: procedures.map((procedure) => procedure.toDto()).toList(),
    );
  }
}
