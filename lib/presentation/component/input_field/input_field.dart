import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';

import '../../../ui/text_styles.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.label,
    required this.placeHolder,
    required this.value,
    required this.onValueChange,
  });

  final String label;
  final String placeHolder;
  final String value;
  final void Function(String value) onValueChange;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 81,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 라벨 텍스트
          Text(
            label,
            style: TextStyles.smallTextRegular.copyWith(color: AppColors.colour),
          ),
          const SizedBox(height: 5), // 라벨과 입력 필드 사이의 간격

          // 입력 필드
          SizedBox(
            height: 55,
            child: TextFormField(
              onChanged: onValueChange,
              initialValue: value.isEmpty ? null : value, // 기본값 설정,,
              style: TextStyles.smallTextRegular.copyWith(color: AppColors.black),
              decoration: InputDecoration(
                hintText: placeHolder, // 플레이스홀더 텍스트
                hintStyle: TextStyles.smallTextRegular.copyWith(color: AppColors.gray4),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10), // 모서리 둥글게
                  borderSide: const BorderSide(
                    color: AppColors.gray4, // 테두리 색상에 맞게 조절
                    width: 1.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder( // 활성화 시 테두리
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: AppColors.gray4,
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder( // 포커스 시 테두리
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: AppColors.primary80, // 포커스 시 테두리 색상 (원하는 색상으로 변경)
                    width: 1.0,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, ), // 내부 패딩
              ),
            ),
          ),
        ],
      ),
    );
  }
}
