class RecipesDto {
  RecipesDto({
    this.recipes,
  });

  RecipesDto.fromJson(dynamic json) {
    if (json['recipes'] != null) {
      recipes = [];
      json['recipes'].forEach((v) {
        recipes?.add(RecipeDto.fromJson(v));
      });
    }
  }

  List<RecipeDto>? recipes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (recipes != null) {
      map['recipes'] = recipes?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class RecipeDto {
  RecipeDto({
    this.category,
    this.id,
    this.name,
    this.image,
    this.chef,
    this.time,
    this.rating,
  });

  RecipeDto.fromJson(dynamic json) {
    category = json['category'];
    id = json['id'];
    name = json['name'];
    image = json['image'];
    chef = json['chef'];
    time = json['time'];
    rating = json['rating'];
  }

  String? category;
  num? id;
  String? name;
  String? image;
  String? chef;
  String? time;
  num? rating;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category'] = category;
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    map['chef'] = chef;
    map['time'] = time;
    map['rating'] = rating;
    return map;
  }
}
