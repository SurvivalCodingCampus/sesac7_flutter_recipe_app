import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/enum/popup_menu_type.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class CustomPopupMenuItem extends StatelessWidget {
  final PopupMenuType menuType;

  const CustomPopupMenuItem({required this.menuType, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          menuType.getIcon(),
          SizedBox(
            width: 16.0,
          ),
          Text(
            menuType.title,
            style: TextStyles.popupMenuTitle,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
