import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';

import '../../../ui/text_styles.dart';

class RatingButton extends StatelessWidget {
  const RatingButton({super.key, required this.text, required this.isSelected, required this.onSelectedCallback});

  final String text;
  final bool isSelected;
  final void Function(bool isSelected) onSelectedCallback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelectedCallback(!isSelected);
      },
      child: Container(
        //alignment: Alignment.center,
        //width: 50,
        height: 28,
        padding: EdgeInsets.symmetric(horizontal: 10), // 여백 추가
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary100 : AppColors.white,
          borderRadius: BorderRadius.circular(10),
          border: isSelected ? null : Border.all(color: AppColors.primary100),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: TextStyles.smallerTextRegular.copyWith(
                color: isSelected ? AppColors.white : AppColors.primary80,
                fontSize: 11,
              ),
            ),
            SizedBox(width: 5),
            Icon(
              Icons.star,
              color: isSelected ? AppColors.white : AppColors.primary80,
              size: 18.0,
            ),
          ],
        ),
      ),
    );
  }
}

// ===========================================================================
// RatingButton을 호출하는 부모 위젯 (StatefulWidget)
// ===========================================================================
class RatingButtonScreen extends StatefulWidget {
  const RatingButtonScreen({super.key});

  @override
  State<RatingButtonScreen> createState() => _RatingButtonScreenState();
}

class _RatingButtonScreenState extends State<RatingButtonScreen> {
  bool _isRatingSelected = false; // RatingButton의 isSelected 상태를 관리하는 변수

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RatingButton 호출'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '버튼 선택됨: $_isRatingSelected',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            RatingButton(
              text: '53333335',
              isSelected: _isRatingSelected, // 상태 변수를 isSelected에 전달
              onSelectedCallback: (newIsSelected) {
                // 콜백이 호출될 때 setState를 사용하여 상태 업데이트
                setState(() {
                  _isRatingSelected = newIsSelected;
                  print('RatingButton 상태 변경됨: $newIsSelected'); // 콘솔 출력
                });
              },
            ),
            const SizedBox(height: 20),
            const Text(
              '버튼을 탭 하세요.',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: RatingButtonScreen()));
}
