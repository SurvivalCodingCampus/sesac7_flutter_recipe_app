
class RecipeDto {
  String? category;
  num? id;
  String? name;
  String? image;
  String? chef;
  String? time;
  num? rating;
  List<RecipeIngredientDto>? ingredients;

  RecipeDto({
      this.category,
      this.id,
      this.name,
      this.image,
      this.chef,
      this.time,
      this.rating,
      this.ingredients,});

  RecipeDto.fromJson(dynamic json) {
    category = json['category'];
    id = json['id'];
    name = json['name'];
    image = json['image'];
    chef = json['chef'];
    time = json['time'];
    rating = json['rating'];
    if (json['ingredients'] != null) {
      ingredients = [];
      json['ingredients'].forEach((v) {
        ingredients?.add(RecipeIngredientDto.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category'] = category;
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    map['chef'] = chef;
    map['time'] = time;
    map['rating'] = rating;
    if (ingredients != null) {
      map['ingredients'] = ingredients?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class RecipeIngredientDto {
  IngredientDto? ingredient;
  num? amount;

  RecipeIngredientDto({
      this.ingredient,
      this.amount,});

  RecipeIngredientDto.fromJson(dynamic json) {
    ingredient = json['ingredient'] != null ? IngredientDto.fromJson(json['ingredient']) : null;
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (ingredient != null) {
      map['ingredient'] = ingredient?.toJson();
    }
    map['amount'] = amount;
    return map;
  }

}

class IngredientDto {
  num? id;
  String? name;
  String? image;

  IngredientDto({
      this.id,
      this.name,
      this.image,});

  IngredientDto.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    return map;
  }

}