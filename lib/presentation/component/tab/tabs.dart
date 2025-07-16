import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';

import '../../../ui/text_styles.dart';

class Tabs extends StatelessWidget {
  const Tabs({
    super.key,
    required this.labels,
    required this.selectedIndex,
    required this.onValueChanged,
  }) : assert(labels.length == 2, 'Labels must contain exactly 2 items'),
       assert(
         selectedIndex >= 0 && selectedIndex <= 1,
         'selectedIndex must be 0 or 1',
       );

  final List<String> labels;
  final int selectedIndex;
  final void Function(int selectedIndex) onValueChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: AppColors.white,
      height: 58,
      padding: const EdgeInsets.symmetric(horizontal: 30),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                onValueChanged(0);
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: selectedIndex == 0
                      ? AppColors.primary100
                      : AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                //width: 150,
                height: 33,
                child: Text(
                  labels[0],
                  style: selectedIndex == 0
                      ? TextStyles.smallerTextBold
                      : TextStyles.smallerTextBold.copyWith(
                          color: AppColors.primary80,
                        ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: GestureDetector(
              onTap: () {
                onValueChanged(1);
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: selectedIndex == 0
                      ? AppColors.white
                      : AppColors.primary100,
                  borderRadius: BorderRadius.circular(10),
                ),
                //width: 150,
                height: 33,
                child: Text(
                  labels[1],
                  style: selectedIndex == 0
                      ? TextStyles.smallerTextBold.copyWith(
                          color: AppColors.primary80,
                        )
                      : TextStyles.smallerTextBold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
