import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/data/model/label.dart';
import 'package:flutter_recipe_app/presentation/component/button/label_button.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';

class Tabs extends StatelessWidget {
  final List<Label> labels;
  final int selectedIndex;
  final Function(int selectedIndex) onValueChange;

  const Tabs({
    super.key,
    required this.labels,
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: labels
              .map(
                (label) => LabelButton(
                  labelName: label.labelTitle,
                  isSelected: labels.indexOf(label) == selectedIndex,
                  onValueChange: (label) {
                    onValueChange(labels.indexOf(label));
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
