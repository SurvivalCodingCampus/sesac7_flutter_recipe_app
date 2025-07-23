import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/label_button.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';

class Tabs extends StatelessWidget {
  final List<String> labelTitles;
  final int selectedIndex;
  final Function(int selectedIndex) onValueChange;

  const Tabs({
    super.key,
    required this.labelTitles,
    required this.selectedIndex,
    required this.onValueChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 58.0,
      decoration: BoxDecoration(color: AppColors.white),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (int i = 0; i < labelTitles.length; i++)
              LabelButton(
                labelName: labelTitles[i],
                isSelected: selectedIndex == i,
                onValueChange: () {
                  onValueChange(i);
                },
              ),
          ],
        ),
      ),
    );
  }
}
