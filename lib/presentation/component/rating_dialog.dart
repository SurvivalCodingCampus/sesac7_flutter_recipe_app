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
  bool firstStarState = false;
  bool secondStarState = false;
  bool thirdStarState = false;
  bool fourthStarState = false;
  bool fifthStarState = false;

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    rating = 1;

                    if (firstStarState == false) {
                      firstStarState = true;
                    } else {
                      secondStarState = false;
                      thirdStarState = false;
                      fourthStarState = false;
                      fifthStarState = false;
                    }
                  });
                },
                child: Icon(
                  size: 20,
                  firstStarState ? Icons.star : Icons.star_border,
                  color: AppColors.rating,
                ),
              ),
              SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    rating = 2;

                    if (secondStarState == false) {
                      firstStarState = true;
                      secondStarState = true;
                    } else {
                      thirdStarState = false;
                      fourthStarState = false;
                      fifthStarState = false;
                    }
                  });
                },
                child: Icon(
                  size: 20,
                  secondStarState ? Icons.star : Icons.star_border,
                  color: AppColors.rating,
                ),
              ),
              SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    rating = 3;

                    if (thirdStarState == false) {
                      firstStarState = true;
                      secondStarState = true;
                      thirdStarState = true;
                    } else {
                      fourthStarState = false;
                      fifthStarState = false;
                    }
                  });
                },
                child: Icon(
                  size: 20,
                  thirdStarState ? Icons.star : Icons.star_border,
                  color: AppColors.rating,
                ),
              ),
              SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    rating = 4;

                    if (fourthStarState == false) {
                      firstStarState = true;
                      secondStarState = true;
                      thirdStarState = true;
                      fourthStarState = true;
                    } else {
                      fifthStarState = false;
                    }
                  });
                },
                child: Icon(
                  size: 20,
                  fourthStarState ? Icons.star : Icons.star_border,
                  color: AppColors.rating,
                ),
              ),
              SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    rating = 5;

                    if (fifthStarState == false) {
                      firstStarState = true;
                      secondStarState = true;
                      thirdStarState = true;
                      fourthStarState = true;
                      fifthStarState = true;
                    }
                  });
                },
                child: Icon(
                  size: 20,
                  fifthStarState ? Icons.star : Icons.star_border,
                  color: AppColors.rating,
                ),
              ),
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
                color:
                    (firstStarState == true ||
                        secondStarState == true ||
                        thirdStarState == true ||
                        fourthStarState == true ||
                        fifthStarState == true)
                    ? AppColors.rating
                    : AppColors.gray4,
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
