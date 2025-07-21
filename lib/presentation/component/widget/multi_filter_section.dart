import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/filter_button.dart';
import 'package:flutter_recipe_app/data/model/recipe/category.dart';

class MultiFilterSection<T> extends StatelessWidget {
  final String title;
  final List<T> filterItemList;
  final Function(T item) onItemSelected;

  final String Function(T item) itemTextBuilder;
  final String Function(T item) itemValueBuilder;

  const MultiFilterSection({
    super.key,
    required this.title,
    required this.filterItemList,
    required this.onItemSelected,
    required this.itemTextBuilder,
    required this.itemValueBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          Wrap(
            alignment: WrapAlignment.start,
            spacing: 10,
            runSpacing: 10,
            children: filterItemList.map((item) {
              final String buttonText = itemTextBuilder(item);

              return FilterButton(
                text: buttonText,
                onTap: () {
                  onItemSelected(item);
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}