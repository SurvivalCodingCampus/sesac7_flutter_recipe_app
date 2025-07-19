import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/ui/app_color.dart';

class SmallIconButton extends StatelessWidget {
  final IconData? icon;

  const SmallIconButton({super.key, this.icon = Icons.add});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: AppColor.Primary100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, color: AppColor.White, size: 20),
    );
  }
}
