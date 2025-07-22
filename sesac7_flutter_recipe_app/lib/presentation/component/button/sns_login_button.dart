import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';

class SnsLoginButton extends StatelessWidget {
  final String imageAssetPath;

  const SnsLoginButton({
    super.key,
    required this.imageAssetPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44.0,
      height: 44.0,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF696969).withOpacity(0.1),
            spreadRadius: 3.0,
            blurRadius: 5.0,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Image.asset(
        imageAssetPath,
        width: 24.0,
        height: 24.0,
      ),
    );
  }
}
