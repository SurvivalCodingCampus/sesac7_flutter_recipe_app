// Dto 는 fromJson, toJson 만 있으면 됨
// JSON을 받아서 Dart 객체로 바꾸고 서버에 다시 보낼 때는 Dart 객체를 JSON으로

class RecipeDto {
  List<Recipes>? recipes;

  RecipeDto({this.recipes});

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
}

class Ingredients {
  Ingredient? ingredient;
  int? amount;

  Ingredients({this.ingredient, this.amount});

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
}

class Ingredient {
  int? id;
  String? name;
  String? image;

  Ingredient({this.id, this.name, this.image});

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
}
