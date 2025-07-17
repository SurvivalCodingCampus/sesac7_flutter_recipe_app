import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class RatingDialog extends StatefulWidget {
  final String title;
  final String actionName;
  final int initialRating;
  final int maxRating;
  final void Function(int rating) onPop;

  const RatingDialog({
    super.key,
    required this.title,
    required this.actionName,
    this.initialRating = 0,
    this.maxRating = 5,
    required this.onPop,
  });

  @override
  State<RatingDialog> createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  late int currentRating;

  // int selectedRating = 0;

  @override
  void initState() {
    currentRating = widget.initialRating;
    super.initState();
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            widget.title,
            style: TextStyles.smallerTextRegular,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(widget.maxRating, (index) {
              return InkWell(
                child: Icon(
                  index < currentRating ? Icons.star : Icons.star_border,
                  color: AppColors.rating,
                  size: 20,
                ),
                onTap: () {
                  setState(() {
                    currentRating = index + 1;
                  });
                },
              );
            }),
          ),
          GestureDetector(
            onTap: currentRating == 0
                ? null
                : () => widget.onPop(currentRating),
            child: Container(
              width: 61,
              height: 20,
              decoration: BoxDecoration(
                color: currentRating > 0 ? AppColors.rating : AppColors.gray4,
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
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: RatingDialog(
            title: 'Rate Recipe',
            actionName: 'Send',
            onPop: (int rating) {print(rating.toString());},
          ),
        ),
      ),
    ),
  );
}
