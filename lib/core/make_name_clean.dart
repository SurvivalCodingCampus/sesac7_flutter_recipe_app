import 'package:flutter_recipe_app/presentation/screen/saved_recipes_screen.dart';

import '../presentation/screen/search_recipes_screen.dart';

extension SavedRecipesScreenNameOptimizer on SavedRecipesScreen {
  String _formatRecipeName(String name) {
    final List<String> listOfName = name.split(' ');

    if (listOfName.length > 3) {
      final String firstWord = listOfName.sublist(0, 3).join(' ');
      final String lastWord = listOfName.sublist(3).join(' ');
      return '$firstWord\n$lastWord';
    }

    return name;
  }

  String getRecipeName(String name) {
    return _formatRecipeName(name);
  }
}

extension SearchRecipesScreenNameOptimizer on SearchRecipesScreen {
  String _formatRecipeName(String name) {
    final List<String> listOfName = name.split(' ');

    if (listOfName.length > 3) {
      final String firstWord = listOfName.sublist(0, 3).join(' ');
      final String lastWord = listOfName.sublist(3).join(' ');
      return '$firstWord\n$lastWord';
    }

    return name;
  }

  String getRecipeName(String name) {
    return _formatRecipeName(name);
  }
}
