import 'package:flutter/material.dart';

import '../../../../ui/text_styles.dart';

class CustomMenuTabItem extends StatelessWidget {
  final void Function(int index) onSelectMenuItem;

  final BuildContext context;
  final int index;
  final IconData icon;
  final String text;
  final bool? isFirst;
  final bool? isLast;

  const CustomMenuTabItem({
    super.key,
    required this.onSelectMenuItem,
    required this.context,
    required this.index,
    required this.icon,
    required this.text,
    this.isFirst = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        onSelectMenuItem(index);
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            8,
            isFirst! ? 20 : 10, // 첫 번째 아이템은 top padding 20
            8,
            isLast! ? 20 : 10, // 마지막 아이템은 bottom padding 20
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(icon, size: 20),
              SizedBox(width: 16),
              Text(
                text,
                style: TextStyles.smallerTextRegular,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
