import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';

class Tabs extends StatelessWidget {
  final List<String> labels;
  final int selectedIndex;
  final void Function(int value) onValueChange;

  const Tabs({
    super.key,
    required this.labels,
    required this.selectedIndex,
    required this.onValueChange,
  });

  // final List<MyTab> myTabs = labels.map((e) => MyTab(tabLabel: e)).toList();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: double.infinity,
          height: 58,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int i = 0; i < labels.length; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: GestureDetector(
                      onTap: () {
                        onValueChange(i);
                      },
                      child: Container(
                        width: labels.length < 3 ? 150 : 107,
                        height: 33,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: selectedIndex == i
                              ? AppColors.primary100
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          labels[i],
                          style: TextStyle(
                            color: selectedIndex == i
                                ? AppColors.white
                                : AppColors.primary100,
                          ),
                        ),
                      ),
                    ),
                  ),
                // SizedBox(width: 10,),
                // Expanded(
                //   child: Container(
                //     alignment: Alignment.center,
                //     decoration: BoxDecoration(
                //         color: selectedIndex == 1 ? AppColors.primary100 : Colors.transparent,
                //         borderRadius: BorderRadius.circular(10)),
                //     child: Text(labels[1], style: TextStyle(color: selectedIndex == 1 ? AppColors.white : AppColors.primary100),),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
