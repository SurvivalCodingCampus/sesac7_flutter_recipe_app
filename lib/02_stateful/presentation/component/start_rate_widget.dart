import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/02_stateful/presentation/ui/app_colors.dart';
import 'package:flutter_recipe_app/02_stateful/presentation/ui/text_styles.dart';

class StarRateWidget extends StatelessWidget {
  final int rating;

  const StarRateWidget({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 37,
      height: 16,
      decoration: BoxDecoration(
        color: AppColors.secondary20,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(7, 4, 3, 8),
                child: Icon(
                  Icons.star,
                  size: 8,
                  color: rating > 0 ? AppColors.rating : AppColors.gray2,
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                child: Text('$rating.0', style: TextStyles.smallerTextRegular),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
