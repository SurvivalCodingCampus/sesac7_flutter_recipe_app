import 'package:flutter/material.dart';

import '../../../ui/app_colors.dart';

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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: double.infinity,
          height: 58,
          child: Row(
            children: [
              for (int i = 0; i < labels.length; i++)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        onValueChange(i);
                      },
                      child: Container(
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
                            height: 75,
                            color: selectedIndex == i
                                ? AppColors.white
                                : AppColors.primary100,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Tabs(
          labels: ['Label1', 'Label2'],
          selectedIndex: 0,
          onValueChange: (int value) {
            print(value);
          },
        ),
      ),
    ),
  );
}
