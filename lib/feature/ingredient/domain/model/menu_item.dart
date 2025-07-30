import 'package:flutter/material.dart';

enum MenuItem {
  share,
  rateRecipe,
  review,
  unsave;

  @override
  String toString() => switch (this) {
    MenuItem.share => 'share',
    MenuItem.rateRecipe => 'Rate Recipe',
    MenuItem.review => 'Review',
    MenuItem.unsave => 'Unsave',
  };

  IconData toIcon() => switch (this) {
    MenuItem.share => Icons.share,
    MenuItem.rateRecipe => Icons.star,
    MenuItem.review => Icons.add_comment,
    MenuItem.unsave => Icons.bookmark_remove,
  };
}
