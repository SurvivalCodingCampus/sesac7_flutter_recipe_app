import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class ProcedureCard extends StatelessWidget {
  final String procedure;
  final int index;

  const ProcedureCard({super.key, required this.procedure, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.gray4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Step $index',
            style: TextStyles.smallerTextBold,
          ),
          SizedBox(height: 10),
          Text(
            procedure,
            style: TextStyles.smallerTextRegular.copyWith(
              color: AppColors.gray3,
            ),
          ),
        ],
      ),
    );
  }
}
