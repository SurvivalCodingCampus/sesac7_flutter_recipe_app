class RecipeDto {
  List<Recipes>? recipes;

  RecipeDto({this.recipes});

  RecipeDto copyWith({List<Recipes>? recipes}) {
    return RecipeDto(recipes: recipes ?? this.recipes);
  }

  Map<String, dynamic> toJson() {
    return {'recipes': recipes};
  }

  factory RecipeDto.fromJson(Map<String, dynamic> json) {
    return RecipeDto(
      recipes: (json['recipes'] as List<dynamic>?)
          ?.map((e) => Recipes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  @override
  String toString() => "RecipeDto(recipes: $recipes)";

  @override
  int get hashCode => recipes.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeDto &&
          runtimeType == other.runtimeType &&
          recipes == other.recipes;
}

class Recipes {
  String? category;
  int? id;
  String? name;
  String? image;
  String? chef;
  String? time;
  double? rating;
  List<Ingredients>? ingredients;

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

  Recipes copyWith({
    String? category,
    int? id,
    String? name,
    String? image,
    String? chef,
    String? time,
    double? rating,
    List<Ingredients>? ingredients,
  }) {
    return Recipes(
      category: category ?? this.category,
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      chef: chef ?? this.chef,
      time: time ?? this.time,
      rating: rating ?? this.rating,
      ingredients: ingredients ?? this.ingredients,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'id': id,
      'name': name,
      'image': image,
      'chef': chef,
      'time': time,
      'rating': rating,
      'ingredients': ingredients,
    };
  }

  factory Recipes.fromJson(Map<String, dynamic> json) {
    return Recipes(
      category: json['category'] as String?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      chef: json['chef'] as String?,
      time: json['time'] as String?,
      rating: json['rating'] as double?,
      ingredients: (json['ingredients'] as List<dynamic>?)
          ?.map((e) => Ingredients.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  @override
  String toString() =>
      "Recipes(category: $category,id: $id,name: $name,image: $image,chef: $chef,time: $time,rating: $rating,ingredients: $ingredients)";

  @override
  int get hashCode =>
      Object.hash(category, id, name, image, chef, time, rating, ingredients);

  @override
  bool operator ==(Object other) =>
    identical(this, other) ||
    other is Recipes &&
      runtimeType == other.runtimeType &&
      category == other.category &&
      id == other.id &&
      name == other.name &&
      image == other.image &&
      chef == other.chef &&
      time == other.time &&
      rating == other.rating &&
      ingredients == other.ingredients;
}

class Ingredients {
  Ingredient? ingredient;
  int? amount;

  Ingredients({this.ingredient, this.amount});

  Ingredients copyWith({Ingredient? ingredient, int? amount}) {
    return Ingredients(
      ingredient: ingredient ?? this.ingredient,
      amount: amount ?? this.amount,
    );
  }

  Map<String, dynamic> toJson() {
    return {'ingredient': ingredient, 'amount': amount};
  }

  factory Ingredients.fromJson(Map<String, dynamic> json) {
    return Ingredients(
      ingredient: json['ingredient'] == null
          ? null
          : Ingredient.fromJson(json['ingredient'] as Map<String, dynamic>),
      amount: json['amount'] as int?,
    );
  }

  @override
  String toString() => "Ingredients(ingredient: $ingredient,amount: $amount)";

  @override
  int get hashCode => Object.hash(ingredient, amount);

  @override
  bool operator ==(Object other) =>
    identical(this, other) ||
    other is Ingredients &&
      runtimeType == other.runtimeType &&
      ingredient == other.ingredient &&
      amount == other.amount;
}

class Ingredient {
  int? id;
  String? name;
  String? image;

  Ingredient({this.id, this.name, this.image});

  Ingredient copyWith({int? id, String? name, String? image}) {
    return Ingredient(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'image': image};
  }

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      id: json['id'] as int?,
      name: json['name'] as String?,
      image: json['image'] as String?,
    );
  }

  @override
  String toString() => "Ingredient(id: $id,name: $name,image: $image)";

  @override
  int get hashCode => Object.hash(id, name, image);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Ingredient &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          image == other.image;
}
