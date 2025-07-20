import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/data/model/recipe/category.dart';
import 'package:flutter_recipe_app/presentation/component/button/medium_button.dart';
import 'package:flutter_recipe_app/presentation/component/widget/multi_filter_section.dart';
import 'package:flutter_recipe_app/presentation/component/widget/rating_filter_section.dart';
import 'package:flutter_recipe_app/presentation/component/widget/single_filter_section.dart';
import 'package:flutter_recipe_app/presentation/ui/app_color.dart';

class FilterBottomSheet extends StatelessWidget {
  final VoidCallback onTap;
  final List<Category> categoryList;

  const FilterBottomSheet({super.key, required this.onTap, required this.categoryList});

  @override
  Widget build(BuildContext context) {
    final _timeItemList = [
      {'id': 1, 'name': 'Newest'},
      {'id': 2, 'name': 'Oldest'},
    ];

    final _ratingItemList = [
      {'id': 1, 'name': '5'},
      {'id': 2, 'name': '4'},
      {'id': 3, 'name': '3'},
      {'id': 4, 'name': '2'},
      {'id': 5, 'name': '1'},
    ];

    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: AppColor.White,
        borderRadius: BorderRadius.only(
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
          SizedBox(height: 20),
          RatingFilterSection(title: 'Rating', filterItemList: _ratingItemList),
          SizedBox(height: 20),
          MultiFilterSection<Category>(
            title: 'Category',
            filterItemList: categoryList,
            onItemSelected: (Category category) {
            },
            itemTextBuilder: (category) => category.name,
            itemValueBuilder: (category) => category.id.toString(),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MediumButton(buttonText: 'filter', onTap: onTap),
            ],
          ),
          SizedBox(height: 22),
        ],
      ),
    );
  }
}