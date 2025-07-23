import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/model/filter_category.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/model/filter_rate.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/model/filter_sort_by.dart';
import 'package:flutter_recipe_app/core/presentation/component/button/filter_button.dart';
import 'package:flutter_recipe_app/core/presentation/component/button/rating_button.dart';
import 'package:flutter_recipe_app/core/presentation/component/button/small_button.dart';
import 'package:flutter_recipe_app/feature/search_recipes/presentation/filter_search_state.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class FilterSearchBottomSheet extends StatefulWidget {
  final FilterSearchState filterState;
  final void Function(FilterSearchState) onFilterChange;

  const FilterSearchBottomSheet({
    super.key,
    required this.filterState,
    required this.onFilterChange,
  });

  @override
  State<FilterSearchBottomSheet> createState() =>
      _FilterSearchBottomSheetState();
}

class _FilterSearchBottomSheetState extends State<FilterSearchBottomSheet> {
  late FilterSearchState state;

  @override
  void initState() {
    super.initState();
    state = widget.filterState;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 31, 30, 0),
        child: Column(
          spacing: 30,
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              spacing: 20,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Filter Search',
                  style: TextStyles.smallTextBold,
                ),
                Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Time', style: TextStyles.smallTextBold),
                    Row(
                      spacing: 10,
                      children: [
                        ...FilterSortBy.values.map(
                          (e) => FilterButton(
                            text: e.toString(),
                            isSelected: e == state.filterSortBy,
                            onTap: (bool oldValue) {
                              setState(() {
                                state = state.copyWith(filterSortBy: e);
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Rate', style: TextStyles.smallTextBold),
                    Row(
                      spacing: 10,
                      children: [
                        ...FilterRate.values.map(
                          (e) => RatingButton(
                            text: '${e.toInt()}',
                            isSelected: e == state.filterRate,
                            onTap: (oldValue) {
                              setState(() {
                                state = state.copyWith(filterRate: e);
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Category', style: TextStyles.smallTextBold),
                      ],
                    ),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        ...FilterCategory.values.map(
                          (e) => FilterButton(
                            text: e.toString(),
                            isSelected: e == state.filterCategory,
                            onTap: (bool oldValue) {
                              setState(() {
                                state = state.copyWith(filterCategory: e);
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SmallButton(
              text: 'Filter',
              onClick: () {
                widget.onFilterChange(state);
              },
            ),
          ],
        ),
      ),
    );
  }
}
