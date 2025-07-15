import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class TwoTabs extends StatelessWidget {
  final List<String> labels;
  final int selectedIndex;
  final void Function(int) onValueChange;

  const TwoTabs({
    super.key,
    required this.labels,
    required this.selectedIndex,
    required this.onValueChange,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 375,
      height: 58,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 30,
          right: 30,
          top: 12,
          bottom: 13,
        ),
        child: Row(
          spacing: 15,
          children: [
            for (int i = 0; i < labels.length; i++)
              SizedBox(
                width: 150,
                height: 33,
                child: GestureDetector(
                  onTap: () => onValueChange(i),
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 9,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: selectedIndex == i
                          ? AppColors.primary100
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      labels[i],
                      style: TextStyles.smallerTextBold.copyWith(
                        color: selectedIndex == i
                            ? AppColors.white
                            : AppColors.primary80,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
