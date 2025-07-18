import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/small_button.dart';
import 'package:flutter_recipe_app/presentation/ui/app_color.dart';

class RatingDialog extends StatefulWidget {
  final String title;
  final String actionName;
  final ValueChanged<int> onRatingChanged;

  const RatingDialog({
    super.key,
    this.title = 'Rate recipe',
    this.actionName = 'send',
    required this.onRatingChanged,
  });

  @override
  State<RatingDialog> createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  int _selectedRating = 0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Center(
        child: Text(
          widget.title,
          style: const TextStyle(fontSize: 17, color: AppColor.Black),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              final ratingValue = index + 1;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedRating = ratingValue;
                  });
                },
                child: Icon(
                  ratingValue <= _selectedRating
                      ? Icons.star
                      : Icons.star_border_outlined,
                  color: AppColor.Rating,
                  size: 32,
                ),
              );
            }),
          ),
          SizedBox(height: 5),
          SmallButton(
            buttonText: widget.actionName,
            buttonColor: AppColor.Rating,
            onTap: _selectedRating > 0
                ? () {
                    widget.onRatingChanged(_selectedRating);
                  }
                : null,
          ),
        ],
      ),
    );
  }
}
