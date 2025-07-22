import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/data/model/recipe/category.dart';
import 'package:flutter_recipe_app/presentation/component/button/medium_button.dart';
import 'package:flutter_recipe_app/presentation/component/widget/multi_filter_section.dart';
import 'package:flutter_recipe_app/presentation/component/widget/rating_filter_section.dart';
import 'package:flutter_recipe_app/presentation/component/widget/single_filter_section.dart';
import 'package:flutter_recipe_app/presentation/screen/recipe/search_recipe_view_model.dart';
import 'package:flutter_recipe_app/presentation/ui/app_color.dart';

class FilterBottomSheet extends StatefulWidget {
  final List<Category> categoryList;
  final SearchRecipeViewModel viewModel;

  FilterBottomSheet({
    super.key,
    required this.categoryList,
    required this.viewModel,
  });

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.addListener(_onViewModelChanged);
  }

  void _onViewModelChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    widget.viewModel.removeListener(_onViewModelChanged);
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final state = widget.viewModel.state;

    final _timeItemList = [
      {'id': 1, 'name': 'Newest'},
      {'id': 2, 'name': 'Oldest'},
    ];

    final _ratingItemList = [
      {'id': 1, 'name': '1'},
      {'id': 2, 'name': '2'},
      {'id': 3, 'name': '3'},
      {'id': 4, 'name': '4'},
      {'id': 5, 'name': '5'},
    ];

    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: AppColor.White,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Filter Search',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColor.Black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SingleFilterSection(title: 'Time', filterItemList: _timeItemList),
          const SizedBox(height: 20),
          RatingFilterSection(
            title: 'Rating',
            filterItemList: _ratingItemList.map((item) {
              final String name = item['name'] as String;
              final int id = item['id'] as int;
              return {
                'text': name,
                'value': id.toString(),
                'id': id,
                'isSelected': state.rating == id,
              };
            }).toList(),
            selectedId: state.rating,
            onRatingSelected: (int id) {
              widget.viewModel.updateRating(id);
            },
          ),
          const SizedBox(height: 20),
          MultiFilterSection<Category>(
            title: 'Category',
            filterItemList: widget.categoryList,
            onItemSelected: (Category category) {
            },
            itemTextBuilder: (category) => category.name,
            itemValueBuilder: (category) => category.id.toString(),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MediumButton(
                buttonText: 'filter',
                  onTap: () {
                    widget.viewModel.filterRecipes();
                    Navigator.pop(context);
                  },
              ),
            ],
          ),
          SizedBox(height: 22),
        ],
      ),
    );
  }
}