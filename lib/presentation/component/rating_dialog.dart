import 'package:flutter/material.dart';

import '../../ui/app_colors.dart';
import '../../ui/text_styles.dart';

class RatingDialog extends StatefulWidget {
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
  int rating = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 91,
      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          Text(widget.title),
          SizedBox(height: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...List.generate(5, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      rating = index + 1;
                    });
                  },
                  child: Icon(
                    size: 20,
                    (rating >= index + 1) ? Icons.star : Icons.star_border,
                    color: AppColors.rating,
                  ),
                );
              }),
            ],
          ),
          SizedBox(height: 5),
          GestureDetector(
            onTap: () {
              widget.onChange(rating);
            },
            child: Container(
              width: 61,
              height: 20,
              decoration: BoxDecoration(
                color: (rating != 0) ? AppColors.rating : AppColors.gray4,
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: Center(
                child: Text(
                  widget.actionName,
                  style: TextStyles.smallTextRegular.copyWith(
                    color: AppColors.white,
                    fontSize: 8,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
