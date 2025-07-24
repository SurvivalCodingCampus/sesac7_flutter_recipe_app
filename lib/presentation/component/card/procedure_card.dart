import 'package:flutter/cupertino.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';

class ProcedureCard extends StatelessWidget {
  final String stepTitle;
  final String content;

  const ProcedureCard({super.key, required this.stepTitle, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0), // 전체적인 여백
      decoration: BoxDecoration(
        color: AppColors.gray3, // 배경색 (이미지에서 회색으로 보임)
        borderRadius: BorderRadius.circular(12.0), // 둥근 모서리
        border: Border.all(
          color: AppColors.primary100, // 파란색 테두리
          width: 2.0,
        ),
      ),
      padding: EdgeInsets.all(20.0), // 내부 여백
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // 텍스트를 왼쪽 정렬
        mainAxisSize: MainAxisSize.min, // 컬럼의 높이를 내용에 맞춤
        children: [
          Text(
            stepTitle,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: AppColors.black, // Step 2 텍스트는 검은색
            ),
          ),
          SizedBox(height: 10.0), // 텍스트 사이 간격
          Text(
            content,
            style: TextStyle(
              fontSize: 16.0,
              color: AppColors.gray3, // 본문 텍스트는 회색
              height: 1.5, // 줄 간격
            ),
          ),
        ],
      ),
    );
  }
}
