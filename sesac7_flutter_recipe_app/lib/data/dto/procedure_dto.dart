class ProcedureDto {
  ProcedureDto({
    this.step,
    this.description,
  });

  ProcedureDto.fromJson(dynamic json) {
    step = json['step'];
    description = json['description'];
  }

  num? step;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['step'] = step;
    map['description'] = description;
    return map;
  }
}
