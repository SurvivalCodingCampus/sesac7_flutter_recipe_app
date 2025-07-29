import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class NetworkErrorDialogButton extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback onTap;

  const NetworkErrorDialogButton({
    super.key,
    required this.buttonTitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap.call();
      },
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.rating,
            borderRadius: BorderRadius.circular(6.0)
        ),
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0),
        child: Text(
          buttonTitle,
          style: TextStyles.networkErrorDialogButtonTitle,
        ),
      ),
    );
  }
}
