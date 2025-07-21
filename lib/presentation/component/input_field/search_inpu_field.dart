
import 'package:flutter/material.dart';

import '../../../ui/app_colors.dart';
import '../../../ui/text_styles.dart';

class SearchInpuField extends StatelessWidget {
  const SearchInpuField({
    super.key,
    required this.placeHolder,
    required this.value,
    required this.onValueChange,
  });

  final String placeHolder;
  final String value;
  final void Function(String value) onValueChange;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 40,
        child: TextFormField(
          onChanged: onValueChange,
          initialValue: value.isEmpty ? null : value, // 기본값 설정,,
          style: TextStyles.smallTextRegular.copyWith(color: AppColors.black),
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 12.0), // 예: 왼쪽에 12픽셀 여백 유지
              child: const Icon(
                Icons.search,
                color: AppColors.gray4,
                size: 20, // 아이콘 시각적 크기 (예시)
              ),
            ),
            // 2. prefixIconConstraints 설정
            prefixIconConstraints: const BoxConstraints(
              // minWidth = 왼쪽 패딩(12) + 아이콘 크기(20) + 원하는 아이콘 오른쪽 여백(예: 4)
              minWidth: 12 + 20 + 4, // 총 36
              minHeight: 40, // TextFormField 높이와 맞춤
            ),
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
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), // 내부 패딩
          ),
        ),
      ),
    );
  }
}
