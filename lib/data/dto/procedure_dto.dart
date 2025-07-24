class ProcedureDto {
  ProcedureDto({
    this.id,
    this.steps,
  });

  ProcedureDto.fromJson(dynamic json) {
    id = json['id'];
    steps = json['steps'] != null ? json['steps'].cast<String>() : [];
  }

  num? id;
  List<String>? steps;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['steps'] = steps;
    return map;
  }
}
