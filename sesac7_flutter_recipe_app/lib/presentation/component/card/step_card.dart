import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class StepCard extends StatelessWidget {
  final String title;
  final String description;

  const StepCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.gray4,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyles.stepCardTitle,
              maxLines: 1,
            ),
            SizedBox(
              width: 5.0,
            ),
            Text(
              description,
              style: TextStyles.stepCardDescription,
            ),
          ],
        ),
      ),
    );
  }
}
