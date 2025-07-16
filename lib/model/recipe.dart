

class Recipe {
  String? category;
  int? id;
  String? name;
  String? image;
  String? chef;
  String? time;
  double? rating;
  // List<Ingredients>? ingredients;

  Recipe({
    this.category,
    this.id,
    this.name,
    this.image,
    this.chef,
    this.time,
    this.rating,
    // this.ingredients,
  });

  Recipe copyWith({
    String? category,
    int? id,
    String? name,
    String? image,
    String? chef,
    String? time,
    double? rating,
    // List<Ingredients>? ingredients,
  }) {
    return Recipe(
      category: category ?? this.category,
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      chef: chef ?? this.chef,
      time: time ?? this.time,
      rating: rating ?? this.rating,
      // ingredients: ingredients ?? this.ingredients,
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
      // 'ingredients': ingredients,
    };
  }

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      category: json['category'] as String?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      chef: json['chef'] as String?,
      time: json['time'] as String?,
      rating: json['rating'] as double?,
      // ingredients: (json['ingredients'] as List<dynamic>?)
      //     ?.map((e) => Ingredients.fromJson(e as Map<String, dynamic>))
      //     .toList(),
    );
  }

  @override
  String toString() =>
      "Recipes(category: $category,id: $id,name: $name,image: $image,chef: $chef,time: $time,rating: $rating,)";
  //ingredients: $ingredients

  @override
  int get hashCode =>
      Object.hash(category, id, name, image, chef, time, rating,);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Recipe &&
              runtimeType == other.runtimeType &&
              category == other.category &&
              id == other.id &&
              name == other.name &&
              image == other.image &&
              chef == other.chef &&
              time == other.time &&
              rating == other.rating;
              // ingredients == other.ingredients;
}
