
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';

import '../../../ui/text_styles.dart';

class RatingDialog extends StatefulWidget {
  final String title;
  final String actionName;
  final void Function(int rating) onChange; // 선택된 점수를 반환하는 콜백

  const RatingDialog({
    super.key,
    this.title = '점수 매기기', // 기본 제목
    this.actionName = '보내기', // 기본 버튼 텍스트
    required this.onChange,
  });

  @override
  State<RatingDialog> createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  int _selectedRating = 0; // 현재 선택된 점수 (기본값 0점)

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent, // 배경을 투명하게 하여 Card가 보이도록 함
      child: UnconstrainedBox(
        child: SizedBox(
          width: 170,
        
          child: Card(
            margin: EdgeInsets.zero, // Dialog의 기본 마진 제거
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            clipBehavior: Clip.antiAlias, // Card의 내용이 둥근 모서리를 벗어나지 않도록 클리핑
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisSize: MainAxisSize.min, // 콘텐츠 크기에 맞춰 높이 조절
                children: [
                  // 다이얼로그 제목
                  Text(
                    widget.title,
                    style: TextStyles.smallerTextRegular.copyWith(color: AppColors.colour, fontSize: 11),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5),
        
                  // 별점 선택 섹션
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      // 별 아이콘과 그 뒤에 간격을 추가합니다.
                      // 마지막 별 뒤에는 간격을 추가하지 않습니다.
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildStar(index + 1), // 1점부터 5점까지 별 생성
                          if (index < 4) const SizedBox(width: 10), // 마지막 별이 아닐 경우에만 10의 간격 추가
                        ],
                      );
                    }),
                  ),
                  const SizedBox(height: 5),
        
                  // 액션 버튼
                  _buildActionButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 각 별 아이콘을 빌드하는 메서드
  Widget _buildStar(int starRating) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedRating = starRating; // 탭된 별의 점수로 업데이트
        });
      },
      child: Icon(
        //Icons.star_rounded, // 둥근 별 아이콘
        starRating <= _selectedRating ? Icons.star_rounded : Icons.star_border_rounded, // 선택된 별은 빨간색, 선택되지 않은 별은 회색
        size: 20,
        color: starRating <= _selectedRating
            ? AppColors.rating // 선택된 별은 주황색
            : AppColors.rating, // 선택되지 않은 별은 회색 투명
      ),
    );
  }

  // 액션 버튼을 빌드하는 메서드
  Widget _buildActionButton(BuildContext context) {
    final bool isButtonEnabled = _selectedRating > 0;

    return GestureDetector(
      onTap: isButtonEnabled
          ? () {
        Navigator.of(context).pop(); // 다이얼로그 닫기
        widget.onChange(_selectedRating); // 선택된 점수를 콜백으로 반환
      }
          : null,
      child: Container(
        decoration: BoxDecoration(
          color: isButtonEnabled ? AppColors.rating : AppColors.gray4,
          borderRadius: BorderRadius.circular(6),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4), // 텍스트 주변 여유
        child: Text(
          widget.actionName,
          style: TextStyles.smallerTextRegular.copyWith(
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}

class RatingDialogExampleScreen extends StatefulWidget {
  const RatingDialogExampleScreen({super.key});

  @override
  State<RatingDialogExampleScreen> createState() => _RatingDialogExampleScreenState();
}

class _RatingDialogExampleScreenState extends State<RatingDialogExampleScreen> {
  int _lastSelectedRating = 0; // 마지막으로 선택된 평점을 저장

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('평점 다이얼로그 예제'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _lastSelectedRating == 0
                  ? '아직 평점이 없습니다.'
                  : '마지막 선택 평점: $_lastSelectedRating점',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return RatingDialog(
                      title: 'Rate recipe', // 다이얼로그 제목 지정
                      actionName: 'Send', // 버튼 텍스트 지정
                      onChange: (rating) {
                        // 콜백 구현: 선택된 점수를 받아 상태 업데이트
                        setState(() {
                          _lastSelectedRating = rating;
                        });
                        print('선택된 평점: $rating점');
                      },
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary100,
                foregroundColor: AppColors.white,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text('평점 다이얼로그 열기', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: RatingDialogExampleScreen()));
}