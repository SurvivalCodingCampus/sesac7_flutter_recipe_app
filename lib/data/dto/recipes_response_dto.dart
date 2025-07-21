class RecipesResponseDto {
  RecipesResponseDto({
    this.recipes,
  });

  RecipesResponseDto.fromJson(dynamic json) {
    if (json['recipes'] != null) {
      recipes = [];
      json['recipes'].forEach((v) {
        recipes?.add(RecipeDto.fromJson(v));
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
    this.ingredients,
  });

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
        ingredients?.add(Ingredients.fromJson(v));
      });
    }
  }

  String? category;
  num? id;
  String? name;
  String? image;
  String? chef;
  String? time;
  num? rating;
  List<Ingredients>? ingredients;

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

class Ingredients {
  Ingredients({
    this.ingredient,
    this.amount,
  });

  Ingredients.fromJson(dynamic json) {
    ingredient = json['ingredient'] != null
        ? IngredientDto.fromJson(json['ingredient'])
        : null;
    amount = json['amount'];
  }

  IngredientDto? ingredient;
  num? amount;

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
  IngredientDto({
    this.id,
    this.name,
    this.imgSrc,
  });

  IngredientDto.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    imgSrc = json['image'];
  }

  num? id;
  String? name;
  String? imgSrc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = imgSrc;
    return map;
  }
}
