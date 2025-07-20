import 'package:flutter_recipe_app/04_ui_state_holder/presentation/screen/search_recipes_screen.dart';

extension MakeNameClean on SearchRecipesScreen {
  String getRecipeName(int index) {
    final List<String> listOfName = viewModel.state.recipes[index].name.split(
      ' ',
    );
    final List<String> result = [];
    if (listOfName.length > 3) {
      final String firstWord = listOfName.sublist(0, 3).join(' ');
      final String lastWord = listOfName.sublist(3).join(' ');

      result.add(firstWord);
      result.add(lastWord);
      return result.join('\n');
    }

    return '\n${viewModel.state.recipes[index].name}';
  }

  String getSearchedRecipeName(int index) {
    final List<String> listOfName = viewModel.state.searchedResult[index].name
        .split(
          ' ',
        );
    final List<String> result = [];
    if (listOfName.length > 3) {
      final String firstWord = listOfName.sublist(0, 3).join(' ');
      final String lastWord = listOfName.sublist(3).join(' ');

      result.add(firstWord);
      result.add(lastWord);
      return result.join('\n');
    }

    return '\n${viewModel.state.searchedResult[index].name}';
  }

  String getFilteredRecipeName(int index) {
    final List<String> listOfName = viewModel.state.filteredRecipes[index].name
        .split(
          ' ',
        );
    final List<String> result = [];
    if (listOfName.length > 3) {
      final String firstWord = listOfName.sublist(0, 3).join(' ');
      final String lastWord = listOfName.sublist(3).join(' ');

      result.add(firstWord);
      result.add(lastWord);
      return result.join('\n');
    }

    return '\n${viewModel.state.filteredRecipes[index].name}';
  }
}
