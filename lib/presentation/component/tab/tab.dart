import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

import '../../../ui/app_colors.dart';

class Tap extends StatelessWidget {
  final List<String> labelList;
  final int selectedIndex;
  final void Function(int) onValueChange;

  const Tap({
    super.key,
    required this.labelList,
    required this.selectedIndex,
    required this.onValueChange,
  });

  @override
  Widget build(BuildContext context) {
    final double tabWidth = 150.0;
    final double tabHeight = 33.0;

    return SizedBox(
      width: 375.0,
      height: 58.0,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 0; i < labelList.length; i++)
            GestureDetector(
              onTap: () {
                onValueChange(i);
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(7.5, 12.0, 7.5, 13.0),
                child: Container(
                  width: tabWidth,
                  height: tabHeight,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: selectedIndex == i
                        ? AppColors.primary100
                        : AppColors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    labelList[i],
                    textAlign: TextAlign.center,
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
    );
  }
}
