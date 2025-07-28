import 'package:flutter_recipe_app/data/procedure/dto/procedure_dto.dart';

import '../domain/model/procedure.dart';

extension DtoToModel on ProcedureDto {
  Procedure toModel() {
    final int convertedId;

    if (id is int) {
      convertedId = id as int;
    } else {
      convertedId = -1;
    }

    return Procedure(
      id: convertedId,
      steps: steps ?? [],
    );
  }
}
