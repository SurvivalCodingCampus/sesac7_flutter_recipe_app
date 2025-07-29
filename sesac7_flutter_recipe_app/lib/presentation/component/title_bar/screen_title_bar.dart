import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/enum/popup_menu_type.dart';
import 'package:flutter_recipe_app/presentation/component/popup_menu/custom_popup_menu_item.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class ScreenTitleBar extends StatelessWidget {
  final String? title;
  final VoidCallback? backButtonClick;
  final Function(PopupMenuType type)? popupMenuItemClick;

  const ScreenTitleBar({
    super.key,
    this.title,
    this.backButtonClick,
    this.popupMenuItemClick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          backButtonClick == null
              ? SizedBox(
                  width: 20.0,
                )
              : GestureDetector(
                  onTap: backButtonClick,
                  child: Icon(
                    Icons.arrow_back,
                    color: AppColors.black,
                    size: 20.0,
                  ),
                ),
          title == null
              ? Spacer()
              : Text(
                  title!,
                  style: TextStyles.searchScreenTitle,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
          popupMenuItemClick == null
              ? SizedBox(
                  width: 20.0,
                )
              : PopupMenuButton(
                  icon: Icon(
                    Icons.more_horiz,
                    size: 24.0,
                  ),
                  color: AppColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),

                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        child: CustomPopupMenuItem(
                          menuType: PopupMenuType.share,
                        ),
                        onTap: () {
                          popupMenuItemClick?.call(PopupMenuType.share);
                        },
                      ),
                      PopupMenuItem(
                        child: CustomPopupMenuItem(
                          menuType: PopupMenuType.rateRecipe,
                        ),
                        onTap: () {
                          popupMenuItemClick?.call(PopupMenuType.rateRecipe);
                        },
                      ),
                      PopupMenuItem(
                        child: CustomPopupMenuItem(
                          menuType: PopupMenuType.review,
                        ),
                        onTap: () {
                          popupMenuItemClick?.call(PopupMenuType.review);
                        },
                      ),
                      PopupMenuItem(
                        child: CustomPopupMenuItem(
                          menuType: PopupMenuType.unSave,
                        ),
                        onTap: () {
                          popupMenuItemClick?.call(PopupMenuType.unSave);
                        },
                      ),
                    ];
                  },
                ),
        ],
      ),
    );
  }
}
