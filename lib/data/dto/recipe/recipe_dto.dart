import 'ingredients_dto.dart';

class RecipeDto {
  String? category;
  int? id;
  String? name;
  String? image;
  String? chef;
  String? time;
  double? rating;
  List<IngredientsDto>? ingredients;

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

  factory RecipeDto.fromJson(Map<String, dynamic> json) => RecipeDto(
    category: json['category'] as String?,
    id: json['id'] as int?,
    name: json['name'] as String?,
    image: json['image'] as String?,
    chef: json['chef'] as String?,
    time: json['time'] as String?,
    rating: (json['rating'] as num?)?.toDouble(),
    ingredients: (json['ingredients'] as List<dynamic>?)
        ?.map((e) => IngredientsDto.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'category': category,
    'id': id,
    'name': name,
    'image': image,
    'chef': chef,
    'time': time,
    'rating': rating,
    'ingredients': ingredients?.map((e) => e.toJson()).toList(),
  };
}
