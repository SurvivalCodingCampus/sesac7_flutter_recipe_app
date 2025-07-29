import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/enum/network_error.dart';
import 'package:flutter_recipe_app/presentation/component/button/network_error_dialog_button.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class NetworkErrorDialog extends StatelessWidget {
  final String dialogTitle;
  final NetworkError networkError;
  final VoidCallback dismiss;

  const NetworkErrorDialog({
    super.key,
    required this.dialogTitle,
    required this.networkError,
    required this.dismiss,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      elevation: 3.0,
      shadowColor: Colors.black,
      title: Text(
        dialogTitle,
        style: TextStyles.networkErrorDialogTitle,
        textAlign: TextAlign.center,
      ),
      titlePadding: const EdgeInsets.only(top: 10.0),
      content: Text(
        networkError.message,
        textAlign: TextAlign.center,
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      actions: <Widget>[
        Center(
          child: NetworkErrorDialogButton(
            buttonTitle: '확인',
            onTap: () {
              dismiss();
            },
          ),
        ),
      ],
      actionsPadding: const EdgeInsets.only(bottom: 10.0),
    );
  }
}
