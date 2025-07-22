import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/small_button.dart';
import '../button/filter_button.dart';
import 'filter_search_state.dart';

class FilterSearchBottomSheet extends StatefulWidget {

  final FilterSearchState initialFilter;
  final void Function(FilterSearchState appliedFilter)? onFilterApplied;

  const FilterSearchBottomSheet({super.key, required this.initialFilter, this.onFilterApplied});

  @override
  State<FilterSearchBottomSheet> createState() => _FilterSearchBottomSheetState();
}

class _FilterSearchBottomSheetState extends State<FilterSearchBottomSheet> {

  late FilterSearchState currentFilter;

  @override
  void initState() {
    super.initState();
    currentFilter = widget.initialFilter;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 30),
            Row(
              children: [
                Text('Filter Search'),
              ],
            ),
            const SizedBox(height: 30),
            Text('Time'),
            Wrap(
              runSpacing: 10,
              spacing: 10,
              children: [
                FilterButton(
                  text: 'All',
                  isSelected: currentFilter.time == 'All',
                  onTap: () {
                    setState(() {
                      currentFilter = currentFilter.copyWith(time: 'All');
                    });
                  },
                ),
                FilterButton(
                  text: 'Newest',
                  isSelected: currentFilter.time == 'Newest',
                  onTap: () {
                    setState(() {
                      currentFilter = currentFilter.copyWith(time: 'Newest');
                    });
                  },
                ),
                FilterButton(
                  text: 'Oldest',
                  isSelected: currentFilter.time == 'Oldest',
                  onTap: () {
                    setState(() {
                      currentFilter = currentFilter.copyWith(time: 'Oldest');
                    });
                  },
                ),
                FilterButton(
                  text: 'Popularity',
                  isSelected: currentFilter.time == 'Popularity',
                  onTap: () {
                    setState(() {
                      currentFilter = currentFilter.copyWith(time: 'Popularity');
                    });
                  },
                ),
              ],
            ),
            Text('Rate'),
            Wrap(
              runSpacing: 10,
              spacing: 10,
              children: [
                FilterButton(
                  text: '5',
                  isSelected: currentFilter.rate == 5,
                  onTap: () {
                    setState(() {
                      currentFilter = currentFilter.copyWith(rate: 5);
                    });
                  },
                ),
                FilterButton(
                  text: '4',
                  isSelected: currentFilter.rate == 4,
                  onTap: () {
                    setState(() {
                      currentFilter = currentFilter.copyWith(rate: 4);
                    });
                  },
                ),
                FilterButton(
                  text: '3',
                  isSelected: currentFilter.rate == 3,
                  onTap: () {
                    setState(() {
                      currentFilter = currentFilter.copyWith(rate: 3);
                    });
                  },
                ),
                FilterButton(
                  text: '2',
                  isSelected: currentFilter.rate == 2,
                  onTap: () {
                    setState(() {
                      currentFilter = currentFilter.copyWith(rate: 2);
                    });
                  },
                ),
                FilterButton(
                  text: '1',
                  isSelected: currentFilter.rate == 1,
                  onTap: () {
                    setState(() {
                      currentFilter = currentFilter.copyWith(rate: 1);
                    });
                  },
                ),
              ],
            ),
            Text('Category'),
            Wrap(
              runSpacing: 10,
              spacing: 10,
              children: [
                FilterButton(
                text: 'All',
                isSelected: currentFilter.category == 'All',
                onTap: () {
                  setState(() {
                    currentFilter = currentFilter.copyWith(category: 'All');
                    });
                  },
                ),
              ]
            ),
            SmallButton(
              text: 'Filter',
              onTap: (){
                widget.onFilterApplied?.call(currentFilter);
              },
              isDisabled: false,
            ),
          ],
        ),
      ),
    );
  }
}
