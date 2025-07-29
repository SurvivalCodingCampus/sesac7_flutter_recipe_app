import 'package:flutter/material.dart';

import '../../../../ui/app_colors.dart';
import '../../../../ui/text_styles.dart';
import '../../data/menu_tab_list.dart';

class CustomMenuTab extends StatelessWidget {
  final void Function() onButtonSelected;
  final void Function(int index) onSelectMenuItem;

  const CustomMenuTab({
    super.key,
    required this.onSelectMenuItem,
    required this.onButtonSelected,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) {
        onButtonSelected();
      },
      menuPadding: EdgeInsets.zero,
      constraints: BoxConstraints(
        maxWidth: 164,
      ),
      color: AppColors.white,
      borderRadius: BorderRadius.circular(8.0),
      icon: Icon(Icons.more_horiz, size: 24),
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
          onTap: () {
            onSelectMenuItem(0);
          },
          child: Padding(
            padding: EdgeInsets.fromLTRB(8, 10, 8, 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.share, size: 20),
                SizedBox(width: 16),
                Text(
                  MenuTabList.Share.name,
                  style: TextStyles.smallerTextRegular,
                ),
              ],
            ),
          ),
        ),
        PopupMenuItem(
          onTap: () {
            onSelectMenuItem(1);
          },
          child: Padding(
            padding: EdgeInsets.fromLTRB(8, 10, 8, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.star, size: 20),
                SizedBox(width: 16),
                Text(
                  MenuTabList.RateRecipe.name.replaceAll(
                    'te',
                    'te ',
                  ),
                  style: TextStyles.smallerTextRegular,
                ),
              ],
            ),
          ),
        ),
        PopupMenuItem(
          onTap: () {
            onSelectMenuItem(2);
          },
          child: Padding(
            padding: EdgeInsets.fromLTRB(8, 10, 8, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.comment, size: 20),
                SizedBox(width: 16),
                Text(
                  MenuTabList.Review.name,
                  style: TextStyles.smallerTextRegular,
                ),
              ],
            ),
          ),
        ),
        PopupMenuItem(
          onTap: () {
            onSelectMenuItem(3);
          },
          child: Padding(
            padding: EdgeInsets.fromLTRB(8, 10, 8, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.bookmark_rounded, size: 20),
                SizedBox(width: 16),
                Text(
                  MenuTabList.Unsave.name,
                  style: TextStyles.smallerTextRegular,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
