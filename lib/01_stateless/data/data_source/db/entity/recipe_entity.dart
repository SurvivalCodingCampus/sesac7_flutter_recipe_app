import '../../../../../../01_stateless/domain/model/recipe.dart';
import '../db_helper.dart';

class RecipeEntity {
  int? id;
  String category;
  String name;
  String imageUrl;
  String chef;
  String time;
  double rating;
  int createdAt;

  RecipeEntity({
    this.id,
    required this.category,
    required this.name,
    required this.imageUrl,
    required this.chef,
    required this.time,
    required this.rating,
    required this.createdAt,
  });

  // Map -> RecipeEntity
  factory RecipeEntity.fromMap(Map<String, dynamic> map) {
    return RecipeEntity(
      id: map[DbHelper.colId],
      category: map[DbHelper.colCategory],
      name: map[DbHelper.colName],
      imageUrl: map[DbHelper.colImageUrl],
      chef: map[DbHelper.colChef],
      time: map[DbHelper.colTime],
      rating: map[DbHelper.colRating],
      createdAt: map[DbHelper.colCreatedAt],
    );
  }

  // RecipeEntity -> Map
  Map<String, dynamic> toMap() {
    return {
      DbHelper.colId: id,
      DbHelper.colCategory: category,
      DbHelper.colName: name,
      DbHelper.colImageUrl: imageUrl,
      DbHelper.colChef: chef,
      DbHelper.colTime: time,
      DbHelper.colRating: rating,
      DbHelper.colCreatedAt: createdAt,
    };
  }

  // RecipeEntity -> Recipe 도메인 모델로 변환
  Recipe toModel() {
    return Recipe(
      category: category,
      id: id!,
      name: name,
      imageUrl: imageUrl,
      chef: chef,
      time: time,
      rating: rating,
      createdAt: DateTime.fromMillisecondsSinceEpoch(createdAt),
    );
  }
}