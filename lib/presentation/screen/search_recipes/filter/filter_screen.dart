import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/screen/search_recipes/filter/search_filter_model.dart';

import 'filter_view_model.dart';

class FilterScreen extends StatelessWidget{

  final FilterViewModel viewModel;
  final List<String> allCategories;
  final void Function(FilterModel) onFilterChanged;
  final VoidCallback onApply; // 여기서 콜백해도 되는지
  const FilterScreen({
    super.key,
    required this.viewModel,
    required this.allCategories,
    required this.onApply,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
  
}