class IngredientsDto {
  IngredientsDto({
    this.ingredients,
  });

  IngredientsDto.fromJson(dynamic json) {
    if (json['ingredients'] != null) {
      ingredients = [];
      json['ingredients'].forEach((v) {
        ingredients?.add(Ingredients.fromJson(v));
      });
    }
  }

  List<Ingredients>? ingredients;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (ingredients != null) {
      map['ingredients'] = ingredients?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Ingredients {
  Ingredients({
    this.id,
    this.name,
    this.image,
  });

  Ingredients.fromJson(dynamic json) {
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
