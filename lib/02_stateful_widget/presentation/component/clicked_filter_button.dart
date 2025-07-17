import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless_widget/ui/app_colors.dart';
import 'package:flutter_recipe_app/01_stateless_widget/ui/text_styles.dart';

class ClickedFilterButton extends StatelessWidget {
  final String text;
  final bool isSelected;

  const ClickedFilterButton({
    super.key,
    required this.text,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 51,
      height: 28,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
        color: AppColors.primary100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        width: 17,
        child: Center(
          child: Text(
            text,
            style: TextStyles.smallTextRegular.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
