import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/data/repository/recipes_repository.dart';

class FilterViewModel with ChangeNotifier {
  final RecipeRepository _repository;

  FilterViewModel(this._repository);
}