class IngredientDto {
  IngredientDto({
    this.id,
    this.name,
    this.image,
  });

  IngredientDto.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  num? id;
  String? name;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    return map;
  }
}
