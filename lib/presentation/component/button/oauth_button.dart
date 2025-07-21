import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/constants/component_constant.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';

class OauthButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const OauthButton({super.key, required this.icon, required this.onTap});

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
                0xff696969,
              ).withAlpha(ComponentConstant.oauthButtonShadowAlpha),
              blurRadius: 5,
              spreadRadius: 3,
            ),
          ],
        ),
        child: Center(
          child: Icon(
            icon,
            size: 24,
          ),
        ),
      ),
    );
  }
}
