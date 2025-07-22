import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/ui/app_color.dart';

class AssetLogoButton extends StatelessWidget {
  final String imageUrl;

  const AssetLogoButton({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white, // 배경색을 지정해야 그림자가 보입니다.
        borderRadius: BorderRadius.circular(10), // 모서리 둥글게
        boxShadow: [
          BoxShadow(
            color: AppColor.Gray4,
            spreadRadius: 2, // 그림자가 얼마나 퍼질지 (양수면 그림자 확장, 음수면 축소)
            blurRadius: 8, // 그림자 블러 정도 (값이 클수록 흐릿해짐)
            offset: const Offset(0, 4), // 그림자 위치 (x, y)
          ),
        ],
      ),
      child: Image.asset(imageUrl, width: 24, height: 24),
    );
  }
}
