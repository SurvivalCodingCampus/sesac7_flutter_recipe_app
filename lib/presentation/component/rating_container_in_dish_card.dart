import 'package:flutter/material.dart';

import '../../ui/app_colors.dart';
import '../../ui/text_styles.dart';

class RatingContainerInDishCard extends StatelessWidget {
  final String rating;

  const RatingContainerInDishCard({
    super.key,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 23,
      padding: EdgeInsets.fromLTRB(7, 3, 7, 3),
      decoration: BoxDecoration(
        color: AppColors.secondary20,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.star, color: AppColors.rating, size: 10),
          SizedBox(width: 4),
          Text(rating, style: TextStyles.smallerTextRegular),
        ],
      ),
    );
  }
}
