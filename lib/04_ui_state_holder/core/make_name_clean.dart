import 'package:flutter_recipe_app/04_ui_state_holder/presentation/screen/search_recipes_screen.dart';

extension MakeNameClean on SearchRecipesScreen {
  String _formatRecipeName(String name) {
    final List<String> listOfName = name.split(' ');

    if (listOfName.length > 3) {
      final String firstWord = listOfName.sublist(0, 3).join(' ');
      final String lastWord = listOfName.sublist(3).join(' ');
      return '$firstWord\n$lastWord';
    }

    return '\n$name';
  }

  String getRecipeName(int index) {
    return _formatRecipeName(viewModel.state.recipes[index].name);
  }

  String getSearchedRecipeName(int index) {
    return _formatRecipeName(viewModel.state.searchedResult[index].name);
  }

  String getFilteredRecipeName(int index) {
    return _formatRecipeName(viewModel.state.filteredRecipes[index].name);
  }
}
