import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/enum/rating_type.dart';
import 'package:flutter_recipe_app/presentation/component/button/rating_dialog_button.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class RatingDialog extends StatefulWidget {
  final String dialogTitle;
  final String dialogButtonTitle;
  final RatingType currentRatingType;
  final Function(RatingType ratingType) onClickDissmissButton;

  const RatingDialog({
    super.key,
    required this.dialogTitle,
    required this.dialogButtonTitle,
    required this.currentRatingType,
    required this.onClickDissmissButton,
  });

  @override
  State<RatingDialog> createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  late RatingType _selectedRatingType;

  @override
  void initState() {
    super.initState();
    _selectedRatingType = widget.currentRatingType;
  }

  Icon _getRatingIcon(RatingType ratingType) =>
      ratingType.getIntValue() <= _selectedRatingType.getIntValue()
      ? Icon(Icons.star, color: AppColors.rating, size: 20.0)
      : Icon(Icons.star_border_outlined, color: AppColors.rating, size: 20.0);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 15.0),
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      elevation: 3.0,
      shadowColor: Colors.black,
      title: Text(
        widget.dialogTitle,
        style: TextStyles.ratingDialogTitle,
        textAlign: TextAlign.center,
      ),
      titlePadding: const EdgeInsets.only(top: 10.0),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        spacing: 10.0,
        children: [
          for (final ratingType in [
            RatingType.gradeOne,
            RatingType.gradeTwo,
            RatingType.gradeThree,
            RatingType.gradeFour,
            RatingType.gradeFive,
          ])
            GestureDetector(
              onTap: () {
                setState(() {
                  _selectedRatingType = ratingType;
                });
              },
              child: _getRatingIcon(ratingType),
            ),
        ],
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 5.0,
      ),
      actions: <Widget>[
        Center(
          child: RatingDialogButton(
            buttonTitle: 'Send',
            buttonActive: _selectedRatingType.getIntValue() > 0,
            onTap: () {
              if (_selectedRatingType != RatingType.gradeZero) {
                widget.onClickDissmissButton(_selectedRatingType);
              }
            },
          ),
        ),
      ],
      actionsPadding: const EdgeInsets.only(bottom: 10.0),
    );
  }
}
