import 'package:flutter/material.dart';

import '../../../ui/app_colors.dart';
import '../../../ui/text_styles.dart';

class RatingDialog extends StatefulWidget {
  final String title;
  final String actionName;
  final int? score;
  final void Function(int rating) onChange;

  const RatingDialog({
    super.key,
    required this.title,
    required this.actionName,
    required this.onChange,
    this.score,
  });

  @override
  State<RatingDialog> createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  // int get _selectedIndex => widget.score ?? 0;

  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    selectedIndex = widget.score ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 91,
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        spacing: 5,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.title,
            style: TextStyles.smallerTextRegular,
          ),
          Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: List.generate(5, (i) {
              return GestureDetector(
                onTap: () => _onStarTap(i),
                child: Icon(
                  selectedIndex > i ? Icons.star : Icons.star_border_outlined,
                  color: AppColors.rating,
                  size: 20,
                ),
              );
            }),
          ),
          GestureDetector(
            onTap: () {
              if (selectedIndex == 0) {
                return;
              }
              widget.onChange(selectedIndex);
            },
            child: Container(
              width: 61,
              height: 20,
              decoration: BoxDecoration(
                color: selectedIndex > 0 ? AppColors.rating : AppColors.gray4,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: Text(
                  widget.actionName,
                  style: TextStyles.smallerTextRegular.copyWith(
                    color: AppColors.white,
                    fontSize: 8,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onStarTap(int index) {
    setState(() {
      selectedIndex = index + 1;
    });
  }
}
