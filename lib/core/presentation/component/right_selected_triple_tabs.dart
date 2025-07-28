import 'package:flutter/material.dart';

import '../../../ui/app_colors.dart';
import '../../../ui/text_styles.dart';

class RightSelectedTripleTabs extends StatelessWidget {
  final List<String> listOfLables;
  final int selectedIndex;
  final void Function(int) onValueChange;

  const RightSelectedTripleTabs({
    super.key,
    required this.listOfLables,
    required this.selectedIndex,
    required this.onValueChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 375,
      height: 58,
      padding: EdgeInsets.fromLTRB(30, 12, 30, 13),
      margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
      decoration: BoxDecoration(
        color: AppColors.white,
      ),
      child: SizedBox(
        // width: 315,
        height: 33,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  onValueChange(0);
                },
                child: Container(
                  // width: 120,
                  height: 33,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                    // width: 120,
                    height: 17,
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                    child: Text(
                      listOfLables[0],
                      textAlign: TextAlign.center,
                      style: TextStyles.smallerTextBold.copyWith(
                        color: AppColors.primary80,
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
                child: Container(
                  // width: 120,
                  height: 33,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                    // width: 120,
                    height: 17,
                    padding: EdgeInsets.fromLTRB(9, 8, 9, 8),
                    child: Text(
                      listOfLables[1],
                      textAlign: TextAlign.center,
                      style: TextStyles.smallerTextBold.copyWith(
                        color: AppColors.primary80,
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
                  onValueChange(2);
                },
                child: Container(
                  // width: 120,
                  height: 33,
                  decoration: BoxDecoration(
                    color: AppColors.primary100,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                    // width: 120,
                    height: 17,
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                    child: Text(
                      listOfLables[2],
                      textAlign: TextAlign.center,
                      style: TextStyles.smallerTextBold.copyWith(
                        color: AppColors.white,
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
