import 'package:flutter/material.dart';

import '../../../../repository/recipes_repository.dart';

class FilterViewModel with ChangeNotifier {
  final RecipeRepository _repository;

  FilterViewModel(this._repository);
}