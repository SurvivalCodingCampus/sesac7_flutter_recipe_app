import 'package:flutter_recipe_app/data/dto/recipe/category_dto.dart';
import 'package:flutter_recipe_app/data/model/recipe/category.dart';

class CategoryMapper {
  static Category fromDto(CategoryDto dto) {
    return Category(id: dto.id ?? 0, name: dto.name ?? "category");
  }

  static CategoryDto toDto(Category model) {
    return CategoryDto(id: model.id, name: model.name);
  }
}
