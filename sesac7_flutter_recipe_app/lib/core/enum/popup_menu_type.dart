import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';

enum PopupMenuType {
  share('share'),
  rateRecipe('Rate Recipe'),
  review('Review'),
  unSave('Unsave');

  final String title;

  const PopupMenuType(this.title);
}

extension PopupMenuTypeExtension on PopupMenuType {
  Icon getIcon([Color? color = AppColors.black, double? size = 20.0]) {
    switch (this) {
      case PopupMenuType.share:
        return Icon(
          Icons.share,
          color: color,
          size: size,
        );
      case PopupMenuType.rateRecipe:
        return Icon(
          Icons.star,
          color: color,
          size: size,
        );
      case PopupMenuType.review:
        return Icon(
          Icons.reviews,
          color: color,
          size: size,
        );
      case PopupMenuType.unSave:
        return Icon(
          Icons.bookmark_outline,
          color: color,
          size: size,
        );
    }
  }
}
