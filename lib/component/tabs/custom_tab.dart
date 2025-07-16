import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_color.dart';

class CustomTab extends StatelessWidget {
  final List<Map<String, Object>> tabData;
  final void Function(int id) onTap;
  final selectedTabId; // 선택이 됐다고 가정한 탭 id

  const CustomTab({
    super.key,
    required this.tabData,
    this.selectedTabId = 1,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 12, bottom: 13, left: 20, right: 20),
      decoration: BoxDecoration(color: AppColor.White),
      child: Row(
        children: tabData.map((data) {
          final int tabId = data['id'] as int;
          final bool isSelected = data['id'] == selectedTabId;
          final String labelText = data['name'] as String;
          final Color selectedTextColor = isSelected
              ? AppColor.White
              : AppColor.Primary100;
          final Color selectedTabColor = isSelected
              ? AppColor.Primary100
              : AppColor.White;

          return Expanded(
            child: GestureDetector(
              onTap: () => onTap(tabId),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: selectedTabColor,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: 83, minHeight: 17),
                    child: Center(
                      child: Text(
                        labelText,
                        style: TextStyle(
                          color: selectedTextColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
