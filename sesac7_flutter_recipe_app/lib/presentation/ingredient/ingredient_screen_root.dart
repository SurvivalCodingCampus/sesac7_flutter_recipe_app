import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/enum/popup_menu_type.dart';
import 'package:flutter_recipe_app/core/enum/rating_type.dart';
import 'package:flutter_recipe_app/presentation/component/dialog/rating_dialog.dart';
import 'package:flutter_recipe_app/presentation/ingredient/ingredient_action.dart';
import 'package:flutter_recipe_app/presentation/ingredient/ingredient_screen.dart';
import 'package:flutter_recipe_app/presentation/ingredient/ingredient_view_model.dart';

class IngredientScreenRoot extends StatefulWidget {
  final int? _id;
  final IngredientViewModel _ingredientViewModel;
  final VoidCallback onIngredientScreenBackButtonClick;

  const IngredientScreenRoot(
    IngredientViewModel ingredientViewModel, {
    super.key,
    int? id,
    required this.onIngredientScreenBackButtonClick,
  }) : _ingredientViewModel = ingredientViewModel,
       _id = id;

  @override
  State<IngredientScreenRoot> createState() => _IngredientScreenRootState();
}

class _IngredientScreenRootState extends State<IngredientScreenRoot> {
  @override
  void initState() {
    super.initState();
    if (widget._id != null) {
      widget._ingredientViewModel.fetchCurrentSelectedRecipe(widget._id!);
      widget._ingredientViewModel.fetchCurrentSelectedRecipeProcedures(
        widget._id!,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget._ingredientViewModel,
      builder: (context, value, child) {
        return IngredientScreen(
          ingredientState: value,
          onAction: (action) {
            if (action is ClickIngredientBackButton) {
              widget.onIngredientScreenBackButtonClick();
            } else if (action is ClickPopupMenuItem) {
              switch (action.menuType) {
                case PopupMenuType.share:
                  break;
                case PopupMenuType.rateRecipe:
                  showDialog(
                    context: context,
                    builder: (dialogContext) {
                      return RatingDialog(
                        dialogTitle: 'Rate recipe',
                        dialogButtonTitle: 'Send',
                        currentRatingType: RatingType.gradeZero,
                        onClickDismissButton: (selectedRatingType) {
                          // fixme Rating 전송 API 필요
                          Navigator.pop(dialogContext);
                        },
                      );
                    },
                  );
                case PopupMenuType.review:
                  break;
                case PopupMenuType.unSave:
                  break;
              }
            } else {
              widget._ingredientViewModel.onAction(action);
            }
          },
        );
      },
    );
  }
}
