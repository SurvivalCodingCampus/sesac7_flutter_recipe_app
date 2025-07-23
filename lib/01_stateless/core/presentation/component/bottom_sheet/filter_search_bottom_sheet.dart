import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/core/presentation/component/bottom_sheet/filter_search_state.dart';

import '../button/filter_button.dart';

class FilterSearchBottomSheet extends StatefulWidget {
  final FilterSearchState filterSearchState;
  final void Function(FilterSearchState state)? onFilter;

  const FilterSearchBottomSheet({
    super.key,
    required this.filterSearchState,
    this.onFilter,
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
    state = widget.filterSearchState;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Filter Search'),
          Text('Time'),
          Wrap(
            runSpacing: 10,
            spacing: 10,
            children: [
              FilterButton(
                text: 'All',
                isSelected: state.time == 'All',
                onTap: (oldValue) {
                  setState(() {
                    state = state.copyWith(time: 'All');
                  });
                },
              ),
              FilterButton(
                text: 'Newest',
                isSelected: state.time == 'Newest',
                onTap: (oldValue) {
                  setState(() {
                    state = state.copyWith(time: 'Newest');
                  });
                },
              ),
              FilterButton(
                text: 'Oldest',
                isSelected: state.time == 'Oldest',
                onTap: (oldValue) {
                  setState(() {
                    state = state.copyWith(time: 'Oldest');
                  });
                },
              ),
              FilterButton(
                text: 'Popularity',
                isSelected: state.time == 'Popularity',
                onTap: (oldValue) {
                  setState(() {
                    state = state.copyWith(time: 'Popularity');
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
                isSelected: state.rate == 5,
                onTap: (oldValue) {
                  setState(() {
                    state = state.copyWith(rate: 5);
                  });
                },
              ),
              FilterButton(
                text: '4',
                isSelected: state.rate == 4,
                onTap: (oldValue) {
                  setState(() {
                    state = state.copyWith(rate: 4);
                  });
                },
              ),
              FilterButton(
                text: '3',
                isSelected: state.rate == 3,
                onTap: (oldValue) {
                  setState(() {
                    state = state.copyWith(rate: 3);
                  });
                },
              ),
              FilterButton(
                text: '2',
                isSelected: state.rate == 2,
                onTap: (oldValue) {
                  setState(() {
                    state = state.copyWith(rate: 2);
                  });
                },
              ),
              FilterButton(
                text: '1',
                isSelected: state.rate == 1,
                onTap: (oldValue) {
                  setState(() {
                    state = state.copyWith(rate: 1);
                  });
                },
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              widget.onFilter?.call(state);
            },
            child: Text('Filter'),
          ),
        ],
      ),
    );
  }
}
