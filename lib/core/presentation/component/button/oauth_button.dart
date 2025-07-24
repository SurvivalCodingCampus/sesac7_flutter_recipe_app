import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/presentation/component/constants/component_constant.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';

class OAuthButton extends StatelessWidget {
  static const int shadowColorValue = 0xff696969;

  final String imageAssetPath;
  final VoidCallback onTap;

  const OAuthButton({
    super.key,
    required this.imageAssetPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(
            ComponentConstant.borderRadius,
          ),
          boxShadow: [
            BoxShadow(
              color: Color(
                shadowColorValue,
              ).withAlpha(ComponentConstant.oauthButtonShadowAlpha),
              blurRadius: 5,
              spreadRadius: 3,
            ),
          ],
        ),
        child: Image.asset(
          imageAssetPath,
          width: 24,
          height: 24,
          errorBuilder: (context, error, stackTrace) => Icon(
            Icons.image_not_supported,
            size: 24,
          ),
        ),
      ),
    );
  }
}
