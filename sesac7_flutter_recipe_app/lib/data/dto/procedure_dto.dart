class ProcedureDto {
  ProcedureDto({
    this.recipeId,
    this.step,
    this.content,
  });

  ProcedureDto.fromJson(dynamic json) {
    recipeId = json['recipeId'];
    step = json['step'];
    content = json['content'];
  }

  num? recipeId;
  num? step;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['recipeId'] = recipeId;
    map['step'] = step;
    map['content'] = content;
    return map;
  }
}
