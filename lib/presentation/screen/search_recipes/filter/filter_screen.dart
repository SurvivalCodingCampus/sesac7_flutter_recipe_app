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
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Filter Search', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

                  const SizedBox(height: 24),
                  const Text('Time', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: TimeFilter.values.map((value) {
                      return ChoiceChip(
                        label: Text(_timeLabel(value)),
                        selected: filter.time == value,
                        onSelected: (_) => viewModel.updateTimeFilter(value),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 24),
                  const Text('Rate'),
                  Wrap(
                    spacing: 8,
                    children: [
                      ...RateFilter.values.map((rate) => ChoiceChip(
                        label: Text('${_rateLabel(rate)}★'),
                        selected: filter.rate == rate,
                        onSelected: (_) => viewModel.updateRateFilter(rate),
                      )),
                      ChoiceChip(
                        label: const Text('All'),
                        selected: filter.rate == null,
                        onSelected: (_) => viewModel.updateRateFilter(null),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),
                  const Text('Category'),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: allCategories.map((category) {
                      return ChoiceChip(
                        label: Text(category),
                        selected: filter.category == category,
                        onSelected: (_) => viewModel.updateCategory(category),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: onApply,
                      child: const Text('Filter'),
                    ),
                  )
                ],
              ),
        );
      },
    );
  }
  String _timeLabel(TimeFilter value) {
    switch (value) {
      case TimeFilter.all:
        return '전체';
      case TimeFilter.newest:
        return '최신순';
      case TimeFilter.oldest:
        return '오래된순';
      case TimeFilter.popularity:
        return '인기순';
    }
  }

// 예시 카테고리 - 실제 데이터로 바꿔야 함
  List<String> get _categories => [
    'All',
    'Breakfast',
    'Lunch',
    'Dinner',
    'Snack',
    'Dessert',
  ];
}