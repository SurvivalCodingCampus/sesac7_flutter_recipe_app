// lib/presentation/component/widget/rating_filter_section.dart

import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/rating_button.dart';

class RatingFilterSection extends StatefulWidget {
  final String title;
  final List<Map<String, dynamic>> filterItemList;
  final int? selectedId;
  final ValueChanged<int> onRatingSelected;

  const RatingFilterSection({
    super.key,
    required this.title,
    required this.filterItemList,
    required this.selectedId,
    required this.onRatingSelected,
  });

  @override
  State<RatingFilterSection> createState() => _RatingFilterSectionState();
}

class _RatingFilterSectionState extends State<RatingFilterSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: widget.filterItemList.reversed.map((item) {
              final int currentId = item['id'] as int;
              final String ratingText = item['text'] as String;

              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: RatingButton(
                  rating: ratingText,
                  isSelected: currentId == widget.selectedId,
                  onTap: () {
                    widget.onRatingSelected(currentId);
                  },
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}