import 'package:flutter_recipe_app/data/dto/procedure_dto.dart';

class ProceduresDto {
  ProceduresDto({
    this.procedures,
  });

  ProceduresDto.fromJson(dynamic json) {
    if (json['procedures'] != null) {
      procedures = [];
      json['procedures'].forEach((v) {
        procedures?.add(ProcedureDto.fromJson(v));
      });
    }
  }

  List<ProcedureDto>? procedures;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (procedures != null) {
      map['procedures'] = procedures?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
