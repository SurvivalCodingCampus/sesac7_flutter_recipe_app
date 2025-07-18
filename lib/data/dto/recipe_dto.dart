class RecipeDto {
  RecipeDto({
    this.recipes,
  });

  RecipeDto.fromJson(dynamic json) {
    if (json['recipes'] != null) {
      recipes = [];
      json['recipes'].forEach((v) {
        recipes?.add(Recipes.fromJson(v));
      });
    }
  }

  List<Recipes>? recipes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (recipes != null) {
      map['recipes'] = recipes?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Recipes {
  Recipes({
    this.category,
    this.id,
    this.name,
    this.image,
    this.chef,
    this.time,
    this.rating,
    this.ingredients,
  });

  Recipes.fromJson(dynamic json) {
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
        ? Ingredient.fromJson(json['ingredient'])
        : null;
    amount = json['amount'];
  }

  Ingredient? ingredient;
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

class Ingredient {
  Ingredient({
    this.id,
    this.name,
    this.image,
  });

  Ingredient.fromJson(dynamic json) {
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
