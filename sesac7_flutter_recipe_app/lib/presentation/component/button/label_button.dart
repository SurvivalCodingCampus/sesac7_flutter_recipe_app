import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/domain/model/label.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class LabelButton extends StatelessWidget {
  final String labelName;
  final bool isSelected;
  final Function(Label lable) onValueChange;

  const LabelButton({
    super.key,
    required this.labelName,
    required this.isSelected,
    required this.onValueChange,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onValueChange(Label(labelTitle: labelName));
      },
      child: Container(
        height: 33.0,
        width: 150.0,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary100 : AppColors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Center(
            child: Text(
              labelName,
              style: isSelected
                  ? TextStyles.tabsSelectedLabelTitle
                  : TextStyles.tabsUnSelectedLabelTitle,
            ),
          ),
        ),
      ),
    );
  }
}
