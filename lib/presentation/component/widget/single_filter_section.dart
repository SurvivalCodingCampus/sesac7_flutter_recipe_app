import 'package:flutter/material.dart'; // Cupertino 대신 Material 사용
import 'package:flutter_recipe_app/presentation/component/button/filter_button.dart';

class SingleFilterSection extends StatelessWidget {
  final String title;
  final bool? isWrap;
  final List<Map<String, dynamic>> filterItemList;

  const SingleFilterSection({
    super.key,
    required this.title,
    this.isWrap = false,
    required this.filterItemList,
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
          isWrap == true
              ? Wrap(
            alignment: WrapAlignment.start,
            spacing: 10,
            runSpacing: 10,
            children: filterItemList.map((item) {
              return FilterButton(
                text: item['text'] as String,
              );
            }).toList(),
          )
              : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: filterItemList.map((item) {
              return FilterButton(
                text: item['text'] as String,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}