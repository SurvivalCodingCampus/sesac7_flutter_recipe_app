import 'package:flutter/material.dart';

import 'ingredient_view_model.dart';

class IngredientScreen extends StatelessWidget {
  final IngredientViewModel viewModel;

  const IngredientScreen({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    final state = viewModel.state;
    return Scaffold(
      appBar: AppBar(
        title: Text('Ingredient ${viewModel.state.recipe?.id}'),
      ),
      body: Center(
        child: Text(state.recipe?.toString() ?? '레시피 정보 없음'),
      ),
    );
  }
}
