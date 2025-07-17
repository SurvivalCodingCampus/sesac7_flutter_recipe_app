import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class RatingDialog extends StatefulWidget {
  static const int maxRating = 5;

  final String title;
  final String actionName;
  final void Function(int rating) onChange;

  const RatingDialog({
    super.key,
    required this.title,
    required this.actionName,
    required this.onChange,
  });

  @override
  State<RatingDialog> createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  int selectedStar = 0;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: Container(
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
        // TODO: Column 가로 사이즈 조절 필요
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
              children: List.generate(RatingDialog.maxRating, (index) {
                return GestureDetector(
                  onTap: () => _onStarTap(index),
                  child: Icon(
                    selectedStar > index ? Icons.star : Icons.star_border,
                    color: AppColors.rating,
                    size: 20,
                  ),
                );
              }),
            ),
            GestureDetector(
              onTap: () {
                if (selectedStar == 0) return;
                widget.onChange(selectedStar);
              },
              child: Container(
                width: 61,
                height: 20,
                decoration: BoxDecoration(
                  color: selectedStar > 0 ? AppColors.rating : AppColors.gray4,
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
      ),
    );
  }

  void _onStarTap(int index) {
    setState(() {
      selectedStar = index + 1;
    });
  }
}
