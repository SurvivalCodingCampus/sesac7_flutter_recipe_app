import 'package:flutter/material.dart';

import '../../../ui/app_colors.dart';
import '../../../ui/text_styles.dart';

class LeftSelectedTabs extends StatelessWidget {
  final List<String> listOfLables;
  final int selectedIndex;
  final void Function(int) onValueChange;

  const LeftSelectedTabs({
    super.key,
    required this.listOfLables,
    required this.selectedIndex,
    required this.onValueChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      decoration: BoxDecoration(
        color: AppColors.white,
      ),
      child: SizedBox(
        height: 33,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  onValueChange(0);
                },
                child: AnimatedContainer(
                  // width: 120,
                  height: 33,
                  decoration: BoxDecoration(
                    color: (selectedIndex == 0)
                        ? AppColors.primary100
                        : AppColors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  duration: Duration(milliseconds: 100),
                  child: Center(
                    child: Text(
                      listOfLables[0],
                      textAlign: TextAlign.center,
                      style: TextStyles.smallerTextBold.copyWith(
                        color: (selectedIndex == 0)
                            ? AppColors.white
                            : AppColors.primary80,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  onValueChange(1);
                },
                child: AnimatedContainer(
                  // width: 120,
                  height: 33,
                  decoration: BoxDecoration(
                    color: (selectedIndex == 1)
                        ? AppColors.primary100
                        : AppColors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  duration: Duration(milliseconds: 100),
                  child: Center(
                    child: Text(
                      listOfLables[1],
                      textAlign: TextAlign.center,
                      style: TextStyles.smallerTextBold.copyWith(
                        color: (selectedIndex == 1)
                            ? AppColors.white
                            : AppColors.primary80,
                      ),
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
